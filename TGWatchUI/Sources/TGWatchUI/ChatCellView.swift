import SwiftUI

public struct ChatCellView: View {
    public init(chat: ChatState, downloadPhoto: @escaping (ChatState) -> Void) {
        self.chat = chat
        self.downloadPhoto = downloadPhoto
    }

    let chat: ChatState
    let downloadPhoto: (ChatState) -> Void

    public var body: some View {
        HStack(alignment: .top, spacing: 8) {
            AvatarView(chat.photo)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                .onAppear {
                    downloadPhoto(chat)
                }

            VStack(alignment: .leading) {
                Text(chat.title)
                    .lineLimit(1)
                    .font(.tgChatTitle)
                    .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 0))
                Text(chat.lastMessageText)
                    .lineLimit(1)
                    .font(.body)

                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    Text(
                        chat.lastMessageDate
                            .map(\.foundationDate)
                            .flatMap(DateFormatter.time(from:))
                            ?? ""
                    )
                    .lineLimit(1)
                    .font(.caption)
                    .foregroundColor(.tgGrey)

                    // TODO: or onplayed?
                    if chat.unreadMentionCount > 0 {
                        UnreadIndicator().foregroundColor(.accentColor)
                    }

                    Spacer()

                    if chat.unreadCount > 0 {
                        UnreadBadge(chat.unreadCount)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 4))
            }
        }
    }
}

private extension Int {
    var foundationDate: Date {
        Date(timeIntervalSince1970: TimeInterval(self))
    }
}
