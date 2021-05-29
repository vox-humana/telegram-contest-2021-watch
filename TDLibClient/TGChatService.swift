import Combine
import Foundation
import TGWatchUI

// TODO: per chat and remove `ChatViewModel`
final class TGChatService {
    private let api: TdApi
    let newMessagesSubject = PassthroughSubject<Message, Never>()

    init(api: TdApi) {
        self.api = api
    }

    // TODO: register in TGService
    func process(update: Update) {
        switch update {
        case let .updateNewMessage(message):
            newMessagesSubject.send(message.message)
        // TODO: send into a stream
        default:
            break
        }
    }

    deinit {
        logger.debug("")
    }

    private func requestMessages(_ chatId: ChatId, from: MessageId, limit: Int = 20) -> AnyPublisher<[Message], Swift.Error> {
        api.request { [api](callback: @escaping (Result<Messages, Swift.Error>) -> Void) in
            try? api.getChatHistory(
                chatId: chatId, fromMessageId: from, limit: limit, offset: 0, onlyLocal: false,
                completion: callback
            )
        }
        // TODO: check total and retry?
        .map { $0.messages ?? [] }
        .eraseToAnyPublisher()
    }
}

extension TdApi {
    func requestUser(_ userId: UserId) -> AnyPublisher<User, Swift.Error> {
        request { [weak self] callback in
            try? self?.getUser(userId: userId, completion: callback)
        }
    }

    func requestChat(_ chatId: ChatId) -> AnyPublisher<Chat, Swift.Error> {
        request { [weak self] callback in
            try? self?.getChat(chatId: chatId, completion: callback)
        }
    }

    func requestSender(_ sender: MessageSender) -> AnyPublisher<SenderDTO, Swift.Error> {
        switch sender {
        case let .messageSenderUser(senderUser):
            return
                requestUser(senderUser.userId)
                    .map(SenderDTO.user)
                    .eraseToAnyPublisher()

        case let .messageSenderChat(senderChat):
            return
                requestChat(senderChat.chatId)
                    .map(SenderDTO.chat)
                    .eraseToAnyPublisher()
        }
    }

    func request<Value>(_ apiCall: @escaping (@escaping (Result<Value, Swift.Error>) -> Void) -> Void) -> AnyPublisher<Value, Swift.Error> {
        Future<Value, Swift.Error> { promise in
            apiCall { response in
                logger.debug("GOT respone \(response)")
                do {
                    let value = try response.get()
                    promise(.success(value))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func fillMessage(_ message: Message) -> AnyPublisher<MessageState, Swift.Error> {
        requestSender(message.sender)
            .compactMap {
                MessageState(message, sender: $0)
            }
            .eraseToAnyPublisher()
    }
}

extension TGChatService: ChatService {
    func chatHistory(_ chatId: ChatId, from: MessageId, limit: Int = 20) -> AnyPublisher<(MessageId, [MessageState]), Swift.Error> {
        requestMessages(chatId, from: from, limit: limit)
            .flatMap { [api] (messages: [Message]) -> AnyPublisher<(MessageId, [MessageState]), Swift.Error> in
                guard let lastMessage = messages.last?.id else {
                    return Just((from, [MessageState]()))
                        .setFailureType(to: Swift.Error.self)
                        .eraseToAnyPublisher()
                }
                let publishers = messages.map {
                    api.fillMessage($0)
                }

                return
                    Publishers.MergeMany(publishers).collect()
                        .map {
                            (lastMessage, $0)
                        }
                        .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }

    public func send(_ message: String, to chat: ChatId) -> AnyPublisher<MessageId, Swift.Error> {
        api.request { [api](callback: @escaping (Result<Message, Swift.Error>) -> Void) in
            let replyMarkup = ReplyMarkup.replyMarkupInlineKeyboard(.init(rows: [[]]))
            try? api.sendMessage(
                chatId: chat,
                inputMessageContent: .inputMessageText(InputMessageText(message)),
                messageThreadId: 0,
                options: MessageSendOptions(disableNotification: false, fromBackground: false, schedulingState: .messageSchedulingStateSendAtDate(.init(sendDate: Int(CFAbsoluteTimeGetCurrent())))),
                replyMarkup: replyMarkup,
                replyToMessageId: 0,
                completion: callback
            )
        }
        .map(\.id)
        .eraseToAnyPublisher()
    }
}

extension InputMessageText {
    init(_ text: String) {
        self.init(
            clearDraft: false,
            disableWebPagePreview: true,
            text: FormattedText(entities: [], text: text)
        )
    }
}
