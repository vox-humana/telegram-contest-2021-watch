import SwiftUI
import Combine

struct ChatListView: View {
    @State var chatList: [Chat] = []
    @ObservedObject var vm: ChatListViewModel
    
    var body: some View {
        List {
            Button("New Message") {
            }
            .buttonStyle(AccentStyle())
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets())
            
            ForEach(vm.list) { chat in
                ChatCellView(chat: chat)
            }
        }
        .navigationBarTitle("Charts")
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView(vm: .init(listPublisher: Just([Chat].fake()).eraseToAnyPublisher()))
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

final class ChatListViewModel: ObservableObject {
    @Published var list: [Chat] = []
    private var subscription: AnyCancellable?

    init(listPublisher: AnyPublisher<[Chat], Never>) {
        subscription = listPublisher.receive(on: DispatchQueue.main).sink { [weak self] chats in
            self?.list = chats
        }
    }
}
