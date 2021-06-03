import Combine
import Foundation
import MapKit
import TGWatchUI // TODO: extract model

final class TGChatService {
    private let api: TdApi
    let newMessagesSubject = PassthroughSubject<Message, Never>()

    init(api: TdApi) {
        self.api = api
    }

    func process(update: Update) {
        switch update {
        case let .updateNewMessage(message):
            newMessagesSubject.send(message.message)
        case let .updateFile(file):
            // TODO: notify
            logger.debug("Update: \(file)")
        default:
            break
        }
    }

    deinit {
        logger.debug("")
    }

    private func requestMessages(_ chatId: ChatId, from: MessageId, limit: Int = 20, forward: Bool = false) -> AnyPublisher<[Message], Swift.Error> {
        api.request { [api](callback: @escaping (Result<Messages, Swift.Error>) -> Void) in
            try? api.getChatHistory(
                chatId: chatId, fromMessageId: from, limit: limit, offset: forward ? -limit : 0, onlyLocal: false,
                completion: callback
            )
        }
        .tryMap {
            if let messages = $0.messages {
                return messages
            }
            if $0.totalCount == 0 {
                return []
            }

            throw Error(code: 1, message: "Not enough data")
        }
        // TODO: pass total for retry on VM
        // .retry(3)
        .eraseToAnyPublisher()
    }

    private func send(content: InputMessageContent, to chat: ChatId) -> AnyPublisher<MessageId, Swift.Error> {
        api.request { [api](callback: @escaping (Result<Message, Swift.Error>) -> Void) in
            let replyMarkup = ReplyMarkup.replyMarkupInlineKeyboard(.init(rows: [[]]))
            try? api.sendMessage(
                chatId: chat,
                inputMessageContent: content,
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
    func newMessages(_ chatId: ChatId) -> AnyPublisher<MessageState, Never> {
        newMessagesSubject
            .filter { $0.chatId == chatId }
            .flatMap { [api] in
                api.fillMessage($0)
                    .catch { _ in
                        Empty(completeImmediately: true).eraseToAnyPublisher()
                    }
            }
            .eraseToAnyPublisher()
    }

    func chatHistory(_ chatId: ChatId, from: MessageId, limit: Int = 20, forward: Bool = false) -> AnyPublisher<(MessageId, [MessageState]), Swift.Error> {
        requestMessages(chatId, from: from, limit: limit, forward: forward)
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

    func send(message: String, to chat: ChatId) -> AnyPublisher<MessageId, Swift.Error> {
        send(content: .inputMessageText(InputMessageText(message)), to: chat)
    }

    func send(voice: URL, to chat: ChatId) -> AnyPublisher<MessageId, Swift.Error> {
        let duration = voice.audioDuration
        let audio = InputMessageContent.inputMessageVoiceNote(
            .init(caption: .init(entities: [], text: ""),
                  duration: Int(duration),
                  voiceNote: .inputFileLocal(.init(path: voice.path)),
                  waveform: Data() // TODO: calculate waveform
            )
        )
        return send(content: audio, to: chat)
    }

    func send(location: CLLocationCoordinate2D, to chat: ChatId) -> AnyPublisher<MessageId, Swift.Error> {
        let location = InputMessageContent.inputMessageLocation(
            .init(heading: 0,
                  livePeriod: 0,
                  location: .init(
                      horizontalAccuracy: 0, latitude: location.latitude, longitude: location.longitude
                  ),
                  proximityAlertRadius: 0)
        )
        return send(content: location, to: chat)
    }

    func download(file: FileId) -> AnyPublisher<String, Swift.Error> {
        api.request { [api](callback: @escaping (Result<File, Swift.Error>) -> Void) in
            let donwloadPriority = 1 // [1..32]
            try? api.downloadFile(fileId: file, limit: 0, offset: 0, priority: donwloadPriority, synchronous: true, completion: callback)
        }
        .map(\.local.path)
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

import AVFoundation

private extension URL {
    var audioDuration: TimeInterval {
        let avAsset = AVAsset(url: self)
        return CMTimeGetSeconds(avAsset.duration)
    }
}
