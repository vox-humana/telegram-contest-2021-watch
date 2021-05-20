import SwiftUI

struct ChatCellView: View {
    let chat: Chat
    let downloadPhoto: (Chat) -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            AvatarView(photo: chat.icon)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                .onAppear {
                    self.downloadPhoto(chat)
                }

            VStack(alignment: .leading) {
                Text(chat.title)
                    .lineLimit(1)
                    .font(.tgChatTitle)
                    .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 0))
                Text(chat.lastMessage.text)
                    .lineLimit(1)
                    .font(.body)

                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    Text(DateFormatter.time(from: chat.lastMessage.date))
                        .font(.caption)
                        .foregroundColor(.tgGrey)
                    
                    if chat.unread {
                        Circle()
                            .size(.init(width: 6, height: 6))
                            .fixedSize()
                            .frame(width: 6, height: 6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.accentColor)
                    }
                    
                    Spacer()

                    if chat.unreadCount > 0 {
                        UnreadBadge(count: chat.unreadCount)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 4))
            }
        }
    }
}

import Combine

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView(
            ChatListViewModel(
                fileLoader: FakeFileLoader(),
                listPublisher: Just([Chat].fake()).eraseToAnyPublisher()
            )
        )
    }
}