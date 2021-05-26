import Combine
import SwiftUI

struct FileServiceEnvironment: EnvironmentKey {
    static var defaultValue: FileLoader = DummyService()
}

struct HistoryServiceEnvironment: EnvironmentKey {
    static var defaultValue: HistoryService = DummyService()
}

extension EnvironmentValues {
    var fileService: FileLoader {
        get { self[FileServiceEnvironment.self] }
        set { self[FileServiceEnvironment.self] = newValue }
    }
}

public extension EnvironmentValues {
    var historyService: HistoryService {
        get { self[HistoryServiceEnvironment.self] }
        set { self[HistoryServiceEnvironment.self] = newValue }
    }
}

public struct ChatListView: View {
    @ObservedObject var vm: ChatListViewModel
    @Environment(\.historyService) var historyService

    public init(_ vm: ChatListViewModel) {
        self.vm = vm
    }

    public var body: some View {
        List {
            Button("New Message") {}
                .buttonStyle(AccentStyle())
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())

            ForEach(vm.list) { chat in
                chatCell(chat)
            }
        }
        .navigationBarTitle("Chats")
    }

    private func chatCell(_ chat: Chat) -> some View {
        NavigationLink(
            destination:
            NavigationLazyView(
                ChatView(
                    vm.chatViewModel(for: chat, historyService: historyService)
                )
            )
        ) {
            ChatCellView(chat: chat) { chat in
                vm.fileLoader.downloadPhoto(for: chat)
            }
        }
        .listRowInsets(EdgeInsets())
    }
}

extension Chat: Identifiable {}

// watchOS7+ 'Text(_:style:)'
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

// TODO: Capsule?
struct UnreadBadge: View {
    let count: Int
    var body: some View {
        Text("\(count)")
            .font(.tgBadgeCount)
            .padding(.horizontal, 5)
            .padding(.vertical, 1)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .foregroundColor(.accentColor)
            )
    }
}

struct UnreadBadge_Previews: PreviewProvider {
    static var previews: some View {
        UnreadBadge(count: 99)
        UnreadBadge(count: 6)
    }
}

public final class ChatListViewModel: ObservableObject {
    @Published var list: [Chat] = []
    private var subscription: AnyCancellable?
    let fileLoader: FileLoader

    // watchOS6 no StateObject
    private var chatVMCache: [ChatId: ChatViewModel] = [:]
    func chatViewModel(for chat: Chat, historyService: HistoryService) -> ChatViewModel {
        if let existed = chatVMCache[chat.id] {
            return existed
        }
        let created = ChatViewModel(
            chat: chat,
            service: historyService
        )
        chatVMCache[chat.id] = created
        return created
    }

    public init(fileLoader: FileLoader, listPublisher: AnyPublisher<[Chat], Never>) {
        self.fileLoader = fileLoader
        subscription = listPublisher.receive(on: DispatchQueue.main).sink { [weak self] chats in
            // TODO: test only
            // self?.list = Array(chats.prefix(1))
            self?.list = chats
        }
    }
}

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
}
