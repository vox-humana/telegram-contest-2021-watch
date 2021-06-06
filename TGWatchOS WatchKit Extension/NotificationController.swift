import SwiftUI
import TGWatchUI
import UserNotifications
import WatchKit

let REPLY_ACTION = "REPLY"

final class NotificationController: WKUserNotificationHostingController<NotificationView> {
    private var state: MessageState?

    override init() {
        UNUserNotificationCenter.debugNotifications("NotificationController")
    }

    override var body: NotificationView {
        NotificationView(message: state!)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func suggestionsForResponseToAction(withIdentifier _: String, for _: UNNotification, inputLanguage _: String) -> [String] {
        UNUserNotificationCenter.debugNotifications(#function)
        // assert(identifier == REPLY_ACTION)
        return ["Hello!", "What's up?", "On my way.", "OK"]
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        UNUserNotificationCenter.debugNotifications(#function)

        notificationActions = [
            UNTextInputNotificationAction(identifier: REPLY_ACTION, title: "Reply", options: []),
        ]

        guard let messageData = notification.request.content.userInfo["Message"] as? Data else {
            UNUserNotificationCenter.debugNotifications("Unknown format of userinfo")
            return
        }

        guard let message = try? JSONDecoder().decode(Message.self, from: messageData) else {
            UNUserNotificationCenter.debugNotifications("Can't decode message from data")
            return
        }
        // TODO: request user
        state = MessageState(message, sender: .user(.profile), reply: nil)
    }
}
