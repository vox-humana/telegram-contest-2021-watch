import Combine
import Foundation
import TGWatchUI

final class TGChatService {
    private let api: TdApi
    private let chatId: ChatId

    init(api: TdApi, chatId: ChatId) {
        self.api = api
        self.chatId = chatId
    }

    // TODO: register in TGService
    func process(update: Update) {
        switch update {
        case let .updateNewMessage(message):
            // TODO: send into a stream
            break
        default:
            break
        }
    }

    deinit {
        logger.debug("")
    }
}

extension TGChatService: HistoryService {
    func chatHistory(_ chatId: ChatId, from: MessageId, limit: Int = 20) -> AnyPublisher<[Message], Never> {
        Future<[Message], Never> { [api] promise in
            try? api.getChatHistory(
                chatId: chatId, fromMessageId: from, limit: limit, offset: 0, onlyLocal: false
            ) { response in
                logger.debug("GOT respone \(response)")
                if let messages = (try? response.get())?.messages {
                    promise(.success(messages))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

extension TGChatService: MessageService {
    public func send(_ message: String) -> AnyPublisher<MessageId, Swift.Error> {
        Future<MessageId, Swift.Error> { [api, chatId] promise in
            let replyMarkup = ReplyMarkup.replyMarkupInlineKeyboard(.init(rows: [[]]))
            try? api.sendMessage(
                chatId: chatId,
                inputMessageContent: .inputMessageText(InputMessageText(message)),
                messageThreadId: 0,
                options: MessageSendOptions(disableNotification: false, fromBackground: false, schedulingState: .messageSchedulingStateSendAtDate(.init(sendDate: Int(CFAbsoluteTimeGetCurrent())))),
                replyMarkup: replyMarkup,
                replyToMessageId: 0
            ) { response in
                logger.debug("GOT respone \(response)")
                do {
                    let message = try response.get()
                    promise(.success(message.id))
                } catch {
                    promise(.failure(error))
                }
            }
        }
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
