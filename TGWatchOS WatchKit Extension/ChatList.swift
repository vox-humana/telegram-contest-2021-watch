import SwiftUI

struct Message {
    let text: String
    let date: Date
}

struct Chat: Identifiable {
    let id: String
    let title: String
    let icon: UIImage
    let lastMessage: Message
}

extension Array where Element == Chat {
    static func fake() -> [Chat] {
        [
            .init(
                id: UUID().uuidString,
                title: "Alicia Torreaux",
                icon: UIImage(systemName: "person")!,
                lastMessage: .init(text: "🥰Sticker", date: Date())
            ),
            .init(
                id: UUID().uuidString,
                title: "Digital Nomads",
                icon: UIImage(systemName: "person.2")!,
                lastMessage: .init(text: "We just reached", date: Date().addingTimeInterval(-3 * 60))
            ),
            .init(
                id: UUID().uuidString,
                title: "James",
                icon: UIImage(systemName: "person")!,
                lastMessage: .init(text: "I'm good thank you!", date: Date().addingTimeInterval(-3 * 60))
            )
        ]
    }
}


struct ChatListView: View {
    @State var chatList: [Chat] = .fake()
    
    var body: some View {
        VStack {
            Button("New Message") {
                
            }
            .buttonStyle(AccentStyle())
            
            List(chatList) { chat in
                ChatCellView(chat: chat)
            }
        }
        .navigationBarTitle("Charts")
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}

struct ChatCellView: View {
    let chat: Chat
    
    var body: some View {
        HStack {
            AvatarView()
            VStack(alignment: .leading) {
                Text(chat.title)
                    .lineLimit(1)
                    .font(.tgChatTitle)
                Text(chat.lastMessage.text)
                    .lineLimit(1)
                    .font(.body)
                Text(DateFormatter.time(from: chat.lastMessage.date))
                    .font(.caption)
            }
        }
    }
}

// 'Text(_:style:)' is only available in application extensions for watchOS 7.0 or newer
extension DateFormatter {
    static func time(from date: Date) -> String {
        timeFormatter.string(from: date)
    }
    
    static var timeFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
}

struct AvatarView: View {
    var body: some View {
        Image(systemName: "person.crop.circle")
            .frame(width: 24, height: 24, alignment: .top)
            .cornerRadius(12)
    }
}
