import SwiftUI
import TGWatchUI

public struct ChatView: View {
    @ObservedObject var vm: ChatViewModel

    public init(_ vm: ChatViewModel) {
        self.vm = vm
    }

    public var body: some View {
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
                                        if vm.messages.first?.id == message.id {
                                            vm.loadMoreHistory()
                                        }
                                    }

                                if !message.isOutgoing {
                                    Spacer()
                                }
                            }
                        }
                        .clearedListStyle()
                    }
                    ReplyPanelView(chatId: vm.chat.id)
                }
            }
        }
        .navigationBarTitle(vm.chat.title)
        .onAppear {
            vm.loadMoreHistory()
        }
    }
}

extension MessageState: Identifiable {}

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

import Combine

public final class ChatViewModel: ObservableObject {
    let chat: Chat
    let service: ChatService
    private var lastMessageId: MessageId?
    @Published var messages: [MessageState]
    @Published var isLoading = false
    private var subscription: AnyCancellable?

    public init(chat: Chat, service: ChatService, messages: [MessageState] = []) {
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
