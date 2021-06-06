import SwiftUI

struct ReplyView: View {
    let state: MessageReplyState
    let accentColor: Bool
    let showSender: Bool

    var body: some View {
        HStack(spacing: 6) {
            Rectangle()
                .fill(replyColor)
                .cornerRadius(2)
                .frame(width: 2, height: 28)
            VStack(alignment: .leading, spacing: -1) {
                Text(state.sender.senderName)
                    .lineLimit(1)
                    .font(.tgSender)
                    .foregroundColor(replyColor)
                Text(state.content)
                    .lineLimit(1)
                    .font(.tgSubtitle)
            }
        }
        .padding(EdgeInsets(top: showSender ? 0 : 7, leading: 11, bottom: 0, trailing: 9))
    }

    private var replyColor: Color {
        accentColor ? Color.compatibleAccentColor : Color.white
    }
}
