import Combine
import SwiftUI
import TGWatchUI

// TODO: move to TGWatchUI
public struct ChatListView: View {
    @ObservedObject var vm: ChatListViewModel
    @Environment(\.chatService) var chatService
    private let showNewMessage: Bool

    public init(_ vm: ChatListViewModel, showNewMessage: Bool = true) {
        self.vm = vm
        self.showNewMessage = showNewMessage
    }

    public var body: some View {
        List {
            if showNewMessage {
                Button("New Message") {
                    // TODO:
                }
                .buttonStyle(AccentStyle())
                .clearedListStyle()
            }
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
                makeChatView(chat)
            )
        ) {
            ChatCellView(chat: chat) { chat in
                vm.downloadPhoto(for: chat)
            }
        }
        .listRowInsets(EdgeInsets())
    }

    private func makeChatView(_ chat: Chat) -> some View {
        let chatService = service.chatService
        return ChatView(
            vm.chatViewModel(for: chat, historyService: chatService)
        )
        .environment(\.chatService, chatService)
    }
}

extension Chat: Identifiable {}

public final class ChatListViewModel: ObservableObject {
    @Published var list: [Chat] = []
    private var subscription: AnyCancellable?
    let chatListService: ChatListService

    // watchOS6 has no StateObject
    private var chatVMCache: [ChatId: ChatViewModel] = [:]
    func chatViewModel(for chat: Chat, historyService: ChatService) -> ChatViewModel {
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

    public init(chatListService: ChatListService) {
        self.chatListService = chatListService
        subscription = chatListService.chatListSignal
            .receive(on: DispatchQueue.main)
            .sink { [weak self] chats in
                self?.list = chats
            }
    }

    public func downloadPhoto(for chat: Chat) {
        chatListService.downloadPhoto(for: chat)
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
