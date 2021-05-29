import SwiftUI
import TGWatchUI

struct ChatView: View {
    @ObservedObject var vm: ChatViewModel
    // @State private var firstScrollToBottom: Bool = true

    init(_ vm: ChatViewModel) {
        self.vm = vm
    }

    var body: some View {
        CompatibleScrollViewReader { _ in
            List { // To override list style that NavigationLink adds :facepalm:
                if vm.messages.isEmpty {
                    if vm.isLoading {
                        ActivityIndicator()
                            .padding()
                    } else {
                        Text("No messages\nhere yet")
                            .font(.tgTitle)
                            .multilineTextAlignment(.center)
                    }
                } else {
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
                                        // TODO: load more
                                        if vm.messages.last?.id == message.id, vm.messages.count == 1 {
                                            vm.loadMoreHistory()
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
                    ReplyPanelView(chatId: vm.chat.id)
                }
            }
            .environment(\.defaultMinListRowHeight, 10)
//            .onReceive(vm.$messages, perform: { _ in
//                if firstScrollToBottom, let id = vm.messages.first?.id {
//                    //DispatchQueue.main.async {
//                        proxy.scrollTo(id, anchor: .top)
//                    //}
//                    //firstScrollToBottom = false
//                }
//            })
            .onAppear {
                vm.loadMoreHistory()
            }
        }
        .navigationBarTitle(vm.chat.title)
    }
}

extension MessageState: Identifiable {}

#if DEBUG
    struct ChatView_Previews: PreviewProvider {
        static let messages: [MessageState] = .preview

        static var previews: some View {
            ChatView(
                ChatViewModel(
                    chat: .preview(id: 0, title: "Alicia", lastMessage: nil),
                    service: DummyChatService(),
                    messages: messages
                )
            )
            .accentColor(.blue)
        }
    }
#endif

import Combine

final class ChatViewModel: ObservableObject {
    let chat: Chat
    let service: ChatService
    private var lastMessageId: MessageId?
    @Published var messages: [MessageState]
    @Published var isLoading = false
    private var subscription: AnyCancellable?

    init(chat: Chat, service: ChatService, messages: [MessageState] = []) {
        self.chat = chat
        self.service = service
        self.messages = messages
        // TODO: preheat
        // loadMoreHistory()
    }

    deinit {
        logger.debug("")
    }

    func loadMoreHistory() {
        guard !isLoading else {
            return
        }

        isLoading = true
        subscription = service
            .chatHistory(chat.id, from: lastMessageId ?? 0, limit: 20)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] error in
                logger.debug(error)
                self?.isLoading = false
            }, receiveValue: { [weak self] tuple in
                self?.lastMessageId = tuple.0
                self?.messages += tuple.1
                self?.isLoading = false
            })
    }
}
