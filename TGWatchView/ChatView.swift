import SwiftUI
import TGWatchUI

struct ChatView: View {
    @ObservedObject var vm: ChatViewModel
    @State private var firstScrollToBottom: Bool = true

    init(_ vm: ChatViewModel) {
        self.vm = vm
    }

    var body: some View {
        CompatibleScrollViewReader { proxy in
            if vm.showFullScreenLoading {
                loadingView
            }

            if vm.isEmpty {
                Text("No messages\nhere yet")
                    .font(.tgTitle)
                    .multilineTextAlignment(.center)
            }

            List { // To override list style that NavigationLink adds :facepalm:
                if vm.showMessages {
                    if vm.isLoading {
                        ActivityIndicator()
                    }

                    ForEach(vm.messages.reversed()) { message in
                        NavigationLink(destination: MessageFullView(message)) {
                            HStack {
                                if message.isOutgoing {
                                    Spacer()
                                }

                                MessageCellView(message)
                                    .tgMessageStyle(
                                        isOutgoing: message.isOutgoing,
                                        hideBackground: message.content.hiddenBackground
                                    )
                                    .onAppear {
                                        if vm.messages.last?.id == message.id {
                                            // TODO: vm.loadMoreHistory()
                                        }
                                    }

                                if !message.isOutgoing {
                                    Spacer()
                                }
                            }
                            .id(message.id)
                        }
                        .clearedListStyle()
                    }
                }

                if vm.showSendPanel {
                    // Extra space
                    Text("")
                        .frame(height: 0)
                        .clearedListStyle()

                    ReplyPanelView(chatId: vm.chat.id)
                }
            }
            .environment(\.defaultMinListRowHeight, 10)
            .onReceive(vm.$initialLoading, perform: { loading in
                if firstScrollToBottom, !loading, let id = vm.messages.first?.id {
                    // First render, then scroll
                    DispatchQueue.main.async {
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                    firstScrollToBottom = false
                }
            })
            .onAppear {
                // vm.loadMoreHistory()
            }
        }
        .navigationBarTitle(vm.chat.title)
    }

    private var loadingView: some View {
        ActivityIndicator()
            .padding()
    }
}

extension MessageState: Identifiable {}

#if DEBUG
    struct ChatView_Previews: PreviewProvider {
        static let messages: [MessageState] = .preview

        static var previews: some View {
            Group {
                ChatView(
                    ChatViewModel(
                        chat: .preview(id: 0, title: "Alicia", lastMessage: nil),
                        service: DummyChatService(),
                        messages: messages
                    )
                )
                ChatView(
                    ChatViewModel(
                        chat: .preview(id: 0, title: "Alicia", lastMessage: nil),
                        service: DummyChatService(),
                        messages: []
                    )
                )
            }
            .accentColor(.blue)
        }
    }
#endif

import Combine

final class ChatViewModel: ObservableObject {
    let chat: Chat
    let service: ChatService

    let minimalHistorySize = 10
    private var lastMessageId: MessageId?
    @Published var messages: [MessageState]
    @Published var isLoading = false
    @Published var initialLoading = true

    private var subscription: AnyCancellable?

    init(chat: Chat, service: ChatService, messages: [MessageState] = []) {
        self.chat = chat
        self.service = service
        self.messages = messages
        // TODO: preheat
        loadMoreHistory()
    }

    deinit {
        logger.debug("")
    }

    var showFullScreenLoading: Bool {
        messages.isEmpty && isLoading
    }

    var isEmpty: Bool {
        messages.isEmpty && !isLoading
    }

    var showMessages: Bool {
        initialLoading == false
    }

    var showSendPanel: Bool {
        chat.canSendMessages && showMessages
    }

    func loadMoreHistory() {
        guard !isLoading else {
            return
        }

        isLoading = true
        subscription = service
            .chatHistory(chat.id, from: lastMessageId ?? 0, limit: minimalHistorySize)
            .receive(on: DispatchQueue.main)
            // TODO: .retry(3)
            .sink(receiveCompletion: { [weak self] error in
                logger.debug(error)
                self?.isLoading = false
                self?.initialLoading = false
            }, receiveValue: { [weak self] tuple in
                guard let self = self else { return }

                let hasMore = self.lastMessageId != tuple.0
                self.lastMessageId = tuple.0
                self.messages += tuple.1
                self.isLoading = false
                if self.messages.count < self.minimalHistorySize, hasMore {
                    self.loadMoreHistory()
                } else {
                    // self.initialLoading = false
                }
            })
    }
}
