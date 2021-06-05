import SwiftUI
import UserNotifications
import WatchKit

let REPLY_ACTION = "REPLY"

final class NotificationController: WKUserNotificationHostingController<NotificationView> {
    // private var bodyText: String = ""
    private var content: UNNotificationContent?

    override var body: NotificationView {
        NotificationView(content: content!)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func suggestionsForResponseToAction(withIdentifier identifier: String, for _: UNNotification, inputLanguage _: String) -> [String] {
        assert(identifier == REPLY_ACTION)
        return ["Hello!", "What's up?", "On my way.", "OK"]
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        content = notification.request.content

        notificationActions = [
            UNTextInputNotificationAction(identifier: REPLY_ACTION, title: "Reply", options: []),
        ]

        logger.debug(notification.request.content)
        try? service.api.processPushNotification(payload: notification.request.content.body) {
            logger.debug($0)
        }
    }
}
