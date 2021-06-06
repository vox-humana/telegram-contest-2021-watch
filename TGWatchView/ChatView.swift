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
                                .frame(maxWidth: .infinity)
                                .clearedListStyle()
                        } else if vm.hasMore {
                            Button {
                                vm.loadMoreHistory()
                            }
                            label: {
                                Text("Load More")
                                    .font(.tgTitle)
                                    .frame(height: 44)
                            }
                        }

                        ForEach(vm.messages.reversed()) { message in
                            NavigationLink(
                                destination:
                                MessageFullView(message, canSendMessages: vm.showSendPanel)
                                    .environment(\.imageLoader, vm)
                                    .environment(\.messageSender, vm)
                            ) {
                                HStack {
                                    if message.isOutgoing {
                                        Spacer()
                                    }

                                    MessageCellView(message)
                                        .tgMessageStyle(message)
                                        .clearedListStyle()
//                                        .onAppear {
//                                            if vm.messages.last?.id == message.id {
//                                                vm.loadMoreHistory()
//                                            }
//                                        }
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

                        SendMessagePanelView(dismissOnSend: false)
                            .environment(\.messageSender, vm)
                    }
                }
                .environment(\.defaultMinListRowHeight, 10)
                .onReceive(vm.$initialLoading, perform: { loading in
                    if firstScrollToBottom, !loading, let id = vm.messages.first?.id {
                        // First render, then scroll
                        DispatchQueue.main.async {
                            // iMessage uses top alignment for the last message
                            proxy.scrollTo(id, anchor: .top)
                        }
                        firstScrollToBottom = false
                    }
                })
                .onAppear {
                    // vm.loadNewMessages()
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
    private(set) var hasMore: Bool = true
    private var lastMessageId: MessageId?
    @Published var messages: [MessageState]
    @Published var isLoading = false
    @Published var initialLoading = true

    private var historySubscription: AnyCancellable?
    private var subscriptions = Set<AnyCancellable>()

    private var loadingImages = NSCache<NSString, TGImageLoadingTask>()
    private var animatedSticker = NSCache<NSString, TGSPlayer>()
    private var fileLoaders = NSCache<NSString, TGFileLoadingTask>()

    init(chat: Chat, service: ChatService, messages: [MessageState] = []) {
        self.chat = chat
        chatService = service
        self.messages = messages
        loadMoreHistory()

        chatService.newMessages(chat.id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in
                guard let self = self else { return }
                // TODO: merge
                logger.debug("New message \(message)")
                self.messages = [message.changingPrivate(chat.isPrivate)] + self.messages
            }
            .store(in: &subscriptions)
    }

    deinit {
        logger.debug("🧹")
    }

    func attach() {}

    func detach() {}

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
        historySubscription = chatService
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
                let newIds = newMessages.map(\.id)
                let oldIds = self.messages.map(\.id)

                guard newIds.first == oldIds.first else {
                    // TODO: check for new messages?
                    logger.assert("\(oldIds) prepending \(newIds)")
                    return
                }

                // TODO: merge
                logger.debug("prepending \(newIds) to \(oldIds)")
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
        historySubscription = chatService
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

                let newIds = tuple.1.map(\.id)
                let oldIds = self.messages.map(\.id)
                logger.debug("appending \(newIds) to \(oldIds)")
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

    func fileTask(file: LocalFileState) -> FileLoadingTask {
        let fileId = file.fileId
        let id = NSString(string: "\(fileId)")
        if let existing = fileLoaders.object(forKey: id) {
            return existing
        }
        let created = TGFileLoadingTask(chatService, file: file)
        fileLoaders.setObject(created, forKey: id)
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

extension ChatViewModel: ChatMessageSender {
    func sendMessage(_ text: String) {
        chatService.send(message: text, to: chat.id)
            .sink { _ in

            } receiveValue: { message in
                logger.debug("sent \(message)")
            }
            .store(in: &subscriptions)
    }

    func sendLocation(_ location: CLLocationCoordinate2D) {
        chatService.send(location: location, to: chat.id)
            .sink { _ in

            } receiveValue: { message in
                logger.debug("sent \(message)")
            }
            .store(in: &subscriptions)
    }

    func sendVoiceFile(_ url: URL) {
        chatService.send(voice: url, to: chat.id)
            .sink { _ in

            } receiveValue: { message in
                logger.debug("sent \(message)")
            }
            .store(in: &subscriptions)
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
        case .chatTypePrivate,
             .chatTypeSecret:
            return true
        case .chatTypeBasicGroup,
             .chatTypeSupergroup:
            return false
        }
    }
}
