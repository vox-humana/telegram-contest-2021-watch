import SwiftUI
import TGWatchUI
import UserNotifications

struct NotificationView: View {
    let message: MessageState

    var body: some View {
        MessageContentView(message)
    }
}

// struct NotificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationView(content: "👋")
//    }
// }
