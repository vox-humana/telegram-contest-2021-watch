import Combine
import UserNotifications

private var subscriptions = Set<AnyCancellable>()

extension ExtensionDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == REPLY_ACTION {
            if let inputResponse = response as? UNTextInputNotificationResponse {
                service.chatService.send(message: inputResponse.userText, to: 534316164)
                    .sink { _ in
                        completionHandler()
                    } receiveValue: { _ in
                    }
                    .store(in: &subscriptions)
            }
        }
    }
}
