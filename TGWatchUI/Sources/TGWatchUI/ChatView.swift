import SwiftUI
import TGWatchModel

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
                        if message.outgoing {
                            Spacer()
                        }

                        MessageCellView(message: message)
                            .onAppear {
                                if vm.messages.first == message {
                                    vm.loadMoreHistory()
                                }
                            }

                        if !message.outgoing {
                            Spacer()
                        }
                    }
                }
            }
        }
        .navigationBarTitle(vm.chat.title)
        .onAppear {
            vm.loadMoreHistory()
        }
    }
}

extension Message: Identifiable {}

import Combine

public final class ChatViewModel: ObservableObject {
    let chat: Chat
    let historyService: HistoryService
    @Published var messages: [Message] = []
    @Published var isLoading = false
    private var subscription: AnyCancellable?

    public init(chat: Chat, service: HistoryService) {
        self.chat = chat
        historyService = service

        // TODO: preheat
        // loadMoreHistory()
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
