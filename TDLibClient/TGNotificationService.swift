import Combine
import TGWatchUI
import UserNotifications
import WatchKit

final class TGNotificationService {
    private let api: TdApi
    private var expectingCompletions: [(WKBackgroundFetchResult) -> Void] = []

    init(api: TdApi) {
        self.api = api
    }

    func process(update: Update) {
        switch update {
        case let .updateNewMessage(update):
            guard !update.message.isOutgoing else {
                break
            }
            guard case .background = WKExtension.shared().applicationState else {
                logger.debug("Ignore update for foreground state")
                return
            }
            // TODO: filter muted chats
            DispatchQueue.main.async {
                self.show(message: update.message)
            }
        case let .updateActiveNotifications(update):
            logger.debug(update)
        case let .updateNotification(update):
            logger.debug(update)
        case let .updateNotificationGroup(update):
            logger.debug(update)
        default:
            break
        }
    }

    private func show(message: Message) {
        guard MessageState(message, sender: .user(.profile), reply: nil) != nil else {
            logger.debug("Unsupported content")
            return
        }

        UNUserNotificationCenter.messageNotification(message)

        if !expectingCompletions.isEmpty {
            let callback = expectingCompletions.removeFirst()
            callback(.newData)
        }
    }

    func processRemoteNotification(_ userInfo: [AnyHashable: Any], completionHandler: @escaping (WKBackgroundFetchResult) -> Void) {
        // TODO: have no idea how to get full payload for very limited APNS data as described here
        // https://core.telegram.org/api/push-updates#possible-notifications
//        do {
//            let payload = try JSONSerialization.data(withJSONObject: userInfo, options: .fragmentsAllowed)
//            try? service.api.processPushNotification(payload: String(data: payload, encoding: .utf8)!) {
//                logger.debug($0)
//            }
//        } catch {
//            logger.debug(error.localizedDescription)
//        }

        // https://core.telegram.org/api/push-updates#possible-notifications
        let messageId = (userInfo["msg_id"] as? String).flatMap(MessageId.init)
        let chatId = (userInfo["chat_id"] as? String).flatMap(ChatId.init)
        let channelId = (userInfo["channel_id"] as? String).flatMap(ChatId.init)
        let userId = (userInfo["from_id"] as? String).flatMap(UserId.init)

//        completionHandler(.newData)
//        return

//        UNUserNotificationCenter.debugNotifications("Received: \(userInfo.debugDescription)")

        guard let messageId = messageId else {
//            UNUserNotificationCenter.debugNotifications("No msg_id in \(userInfo)")
//            logger.assert("No msg_id in \(userInfo)")
            completionHandler(.noData)
            return
        }

        let someChatId = chatId ?? channelId
        guard var someChatId = someChatId else {
//            UNUserNotificationCenter.debugNotifications("No chat_id in \(userInfo)")
//            logger.assert("No chat_id in \(userInfo)")
            completionHandler(.noData)
            return
        }

        expectingCompletions.append(completionHandler)

//        UNUserNotificationCenter.messageNotification(.preview(id: 0, content: .messageText(.preview("HELLO")), outgoing: false))

//        chatService
//            .newMessagesSubject
//            .filter { !$0.isOutgoing }
//            .prefix(1)
//            .receive(on: DispatchQueue.main)
//            .sink { message in
//                UNUserNotificationCenter.messageNotification(message)
//                completionHandler(.newData)
//            }
//            .store(in: &subscriptions)

        return

        // Bloody hell
        if someChatId > 0 {
            someChatId = -someChatId
        }
        // https://github.com/tdlib/td/issues/791
        // https://github.com/tdlib/td/issues/578
        UNUserNotificationCenter.debugNotifications("Requesting chat for \(someChatId)")

//        authService.authStateSignal.filter {
//            if case .authorized = $0 {
//                return true
//            }
//            return false
//        }
//        .prefix(1)
//        .eraseToAnyPublisher()
//        .flatMap { [api] (flag: AuthState) in
        api.request { [api](callback: @escaping (Result<Chat, Swift.Error>) -> Void) in
            UNUserNotificationCenter.debugCatch {
                try api.getChat(chatId: someChatId, completion: callback)
            }
        }
//        }
        .flatMap { [api] (chat: Chat) -> AnyPublisher<Message, Swift.Error> in
            UNUserNotificationCenter.debugNotifications("GOT CHAT: \(chat.title)")

            return api.request { [api](callback: @escaping (Result<Message, Swift.Error>) -> Void) in
                UNUserNotificationCenter.debugCatch {
                    try api.getMessage(chatId: chat.id, messageId: messageId, completion: callback)
                }
            }
            .eraseToAnyPublisher()
        }
        .receive(on: DispatchQueue.main)
        .sink { result in
            if case let .failure(error) = result {
                UNUserNotificationCenter.debugNotifications(error.localizedDescription)
                completionHandler(.newData)
            }
        } receiveValue: { m in
            UNUserNotificationCenter.messageNotification(m)
            completionHandler(.newData)
        }
//        .store(in: &subscriptions)

        /*
                authService.authStateSignal.sink { [api] state in
                    guard case .authorized = state else {
                        return
                    }
                    do {
                        try api.getChat(chatId: someChatId) { [api] chatResult in
                            guard let chat = try? chatResult.get() else {
                                DispatchQueue.main.async {
                                    UNUserNotificationCenter.debugNotifications("Can't request chat \(chatResult)")
                                    completionHandler(.failed)
                                }
                                return
                            }

                            try api.getMessage(chatId: someChatId, messageId: messageId) { result in
                                DispatchQueue.main.async {
                                    logger.debug(result)
                                    guard let message = try? result.get() else {
                                        UNUserNotificationCenter.debugNotifications("Can't request message \(result)")
                                        completionHandler(.failed)
                                        return
                                    }

                                    UNUserNotificationCenter.messageNotification(message)
                                    completionHandler(.newData)
                                }
                            }
                        }

                    } catch {
                        UNUserNotificationCenter.debugNotifications(error.localizedDescription)
                    }
                }
                .store(in: &subscriptions)
         */
    }
}

extension UNUserNotificationCenter {
    static func debugCatch(_ block: () throws -> Void) {
        do {
            try block()
        } catch {
            UNUserNotificationCenter.debugNotifications(error.localizedDescription)
        }
    }

    static func debugNotifications(_ text: String) {
        DispatchQueue.main.async {
            logger.debug(text)

            let notification = UNMutableNotificationContent()
            notification.title = "[DEBUG]"
            notification.body = text
            notification.threadIdentifier = "[DEBUG]"
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: notification, trigger: nil)
            UNUserNotificationCenter.current().add(request)
        }
    }

    static func messageNotification(_ message: Message) {
        logger.debug("Sending: \(message)")

        guard let encodedMessage = try? JSONEncoder().encode(message) else {
            debugNotifications("Can't encode message")
            return
        }
        let notification = UNMutableNotificationContent()
        notification.title = "Local notification"
        notification.body = message.lastMessageText
        notification.categoryIdentifier = "myCategory"
        notification.userInfo = ["Message": encodedMessage]
        notification.sound = .default

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notification, trigger: nil)

        UNUserNotificationCenter.current().add(request)
    }
}
