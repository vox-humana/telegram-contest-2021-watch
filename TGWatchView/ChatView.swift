import SwiftUI
import TGWatchUI

public struct ChatView: View {
    @ObservedObject var vm: ChatViewModel

    public init(_ vm: ChatViewModel) {
        self.vm = vm
    }

    public var body: some View {
        ScrollView {
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
                    HStack {
                        if message.isOutgoing {
                            Spacer()
                        }

                        MessageCellView(message: message)
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
                ReplyPanelView()
            }
        }
        .navigationBarTitle(vm.chat.title)
        .onAppear {
            vm.loadMoreHistory()
        }
    }
}

extension Message: Identifiable {}

#if DEBUG
    struct ChatView_Previews: PreviewProvider {
        static let messages: [Message] = .preview()

        static var previews: some View {
            ChatView(
                ChatViewModel(
                    chat: .preview(id: 0, title: "Alicia", lastMessage: nil),
                    service: DummyService(),
                    messages: messages
                )
            )
            .accentColor(.blue)
        }
    }
#endif

import Combine

public final class ChatViewModel: ObservableObject {
    let chat: Chat
    let historyService: HistoryService
    @Published var messages: [Message]
    @Published var isLoading = false
    private var subscription: AnyCancellable?

    public init(chat: Chat, service: HistoryService, messages: [Message] = []) {
        self.chat = chat
        historyService = service
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
        subscription = historyService
            .chatHistory(chat.id, from: lastMessageId, limit: 20)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] messages in
                self?.messages += messages
                self?.isLoading = false
            }
    }

    private var lastMessageId: MessageId {
        messages.last?.id ?? 0
    }
}
