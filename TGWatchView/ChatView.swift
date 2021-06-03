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

            if !vm.showFullScreenLoading {
                List { // To override list style that NavigationLink adds :facepalm:
                    if vm.showMessages {
                        if vm.isLoading {
                            ActivityIndicator(size: 24)
                                .padding()
                                .clearedListStyle()
                        }

                        ForEach(vm.messages.reversed()) { message in
                            NavigationLink(
                                destination:
                                MessageFullView(message)
                                    .environment(\.imageLoader, vm)
                            ) {
                                HStack {
                                    if message.isOutgoing {
                                        Spacer()
                                    }

                                    MessageCellView(message)
                                        .tgMessageStyle(message)
                                        .clearedListStyle()
                                        .onAppear {
                                            if vm.messages.last?.id == message.id {
                                                // TODO: load more button for WatchOS6
                                                // vm.loadMoreHistory()
                                            }
                                        }
                                        .environment(\.imageLoader, vm)

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
                        // Trying to add extra space to List (padding doesn't work)
                        Text("")
                            .frame(height: 0)
                            .clearedListStyle()

                        SendMessagePanelView(chatId: vm.chat.id)
                    }
                }
                .environment(\.defaultMinListRowHeight, 10)
                .onReceive(vm.$initialLoading, perform: { loading in
                    if firstScrollToBottom, !loading, let id = vm.messages.first?.id {
                        // First render, then scroll
                        DispatchQueue.main.async { // asyncAfter(deadline: .now() + .milliseconds(900)) {
                            proxy.scrollTo(id, anchor: .bottom)
                        }
                        firstScrollToBottom = false
                    }
                })
                .onAppear {
                    vm.loadNewMessages()
                }
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
    let chatService: ChatService

    private let minimalHistorySize = 10
    private let defaultChunkSize = 10
    private var hasMore: Bool = true
    private var lastMessageId: MessageId?
    @Published var messages: [MessageState]
    @Published var isLoading = false
    @Published var initialLoading = true

    private var subscription: AnyCancellable?

    private var loadingImages = NSCache<NSString, TGImageLoadingTask>()
    private var animatedSticker = NSCache<NSString, TGSPlayer>()

    init(chat: Chat, service: ChatService, messages: [MessageState] = []) {
        self.chat = chat
        chatService = service
        self.messages = messages
        loadMoreHistory()
    }

    deinit {
        logger.debug("🧹")
    }

    var showFullScreenLoading: Bool {
        initialLoading || (messages.isEmpty && isLoading)
    }

    var isEmpty: Bool {
        messages.isEmpty && !isLoading
    }

    var showMessages: Bool {
        !initialLoading && !messages.isEmpty
    }

    var showSendPanel: Bool {
        chat.canSendMessages && !showFullScreenLoading
    }

    func loadNewMessages() {
        guard !isLoading else {
            return
        }

        guard let firstMessageId = messages.first?.id else {
            logger.debug("No history in chat, ignore refresh")
            return
        }

        isLoading = true
        subscription = chatService
            .chatHistory(chat.id, from: firstMessageId, limit: minimalHistorySize, forward: true)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] error in
                logger.debug(error)
                self?.isLoading = false
            }, receiveValue: { [weak self] tuple in
                guard let self = self else { return }

                defer {
                    self.isLoading = false
                }

                let newMessages = tuple.1.map { $0.changingPrivate(self.chat.isPrivate) }
                guard newMessages.last?.id == firstMessageId else {
                    // TODO: check for new messages?
                    let newIds = newMessages.map(\.id)
                    let oldIds = self.messages.map(\.id)
                    logger.assert("\(oldIds) prepending \(newIds)")
                    return
                }

                // TODO: merge
                self.messages = newMessages.dropFirst() + self.messages
            })
    }

    func loadMoreHistory() {
        guard !isLoading else {
            return
        }

        guard hasMore else {
            logger.debug("Chat doesn't have more messages, ignore more loading")
            return
        }

        isLoading = true
        subscription = chatService
            .chatHistory(chat.id, from: lastMessageId ?? 0, limit: defaultChunkSize, forward: false)
            .receive(on: DispatchQueue.main)
            // TODO: .retry(3)
            .sink(receiveCompletion: { [weak self] error in
                logger.debug(error)
                self?.isLoading = false
                self?.initialLoading = false
            }, receiveValue: { [weak self] tuple in
                guard let self = self else { return }

                self.hasMore = self.lastMessageId != tuple.0
                self.lastMessageId = tuple.0
                self.messages += tuple.1.map { $0.changingPrivate(self.chat.isPrivate) }
                self.isLoading = false
                if self.messages.count < self.minimalHistorySize, self.hasMore {
                    self.loadMoreHistory()
                }
            })
    }
}

extension ChatViewModel: ImageLoader {
    func task(photo: ThumbnailState) -> ImageLoadingTask {
        let fileId = String(photo.thumbnail?.file.fileId ?? 0)
        let hasData = photo.minithumbnail == nil ? "0" : "1"

        let id = NSString(string: "\(fileId)-\(hasData)")
        if let existing = loadingImages.object(forKey: id) {
            return existing
        }
        let created = TGImageLoadingTask(chatService, photo: photo)
        loadingImages.setObject(created, forKey: id)
        return created
    }

    func player(sticker: StickerState) -> TGSPlayer {
        let fileId = sticker.file.fileId
        let id = NSString(string: "\(fileId)")
        if let existing = animatedSticker.object(forKey: id) {
            return existing
        }
        let created = TGSPlayer(fileDownload: chatService.download(file: fileId))
        animatedSticker.setObject(created, forKey: id)
        return created
    }
}

private extension MessageState {
    func changingPrivate(_ isPrivate: Bool) -> MessageState {
        var m = self
        m.privateChat = isPrivate
        return m
    }
}

private extension Chat {
    var isPrivate: Bool {
        switch type {
        case .chatTypePrivate:
            return true
        case .chatTypeBasicGroup(_),
             .chatTypeSupergroup(_),
             .chatTypeSecret:
            return false
        }
    }
}
