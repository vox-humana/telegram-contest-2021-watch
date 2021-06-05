import SwiftUI
import UserNotifications

struct NotificationView: View {
    let content: UNNotificationContent

    var body: some View {
        VStack {
            Text(content.body)
            Text("---")
            Text(content.userInfo.description)
        }
    }
}

// struct NotificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationView(content: "👋")
//    }
// }
