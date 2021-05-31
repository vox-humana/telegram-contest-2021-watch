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
                                    .onAppear {
                                        if vm.messages.last?.id == message.id {
                                            // TODO: vm.loadMoreHistory()
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
    let chatService: ChatService

    let minimalHistorySize = 10
    private var lastMessageId: MessageId?
    @Published var messages: [MessageState]
    @Published var isLoading = false
    @Published var initialLoading = true

    private var subscription: AnyCancellable?

    private var loadingImages = NSCache<NSString, TGImageLoadingTask>()

    init(chat: Chat, service: ChatService, messages: [MessageState] = []) {
        self.chat = chat
        chatService = service
        self.messages = messages
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
        subscription = chatService
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
}

final class TGImageLoadingTask: ImageLoadingTask {
    private let imageSubject = CurrentValueSubject<Image?, Never>(nil)
    private let chatService: ChatService
    private let photo: ThumbnailState
    private var subscription: AnyCancellable?

    init(_ chatService: ChatService, photo: ThumbnailState) {
        self.chatService = chatService
        self.photo = photo
        subscription = load(photo: photo).sink { [weak self] in
            self?.imageSubject.send($0)
        }
    }

    var image: AnyPublisher<Image?, Never> { imageSubject.eraseToAnyPublisher() }

    private func load(photo: ThumbnailState) -> AnyPublisher<Image?, Never> {
        if let thumbnail = photo.thumbnail, thumbnail.file.downloaded {
            return Self.image(from: thumbnail.file.path, format: thumbnail.format)
        }

        let miniThumbnail = Self.thumbnail(for: photo.minithumbnail?.data)

        if let thumbnail = photo.thumbnail {
            return
                chatService.download(file: thumbnail.file.fileId)
                    // TODO: .retry(3)
                    .catch { (error: Swift.Error) -> AnyPublisher<String, Never> in
                        logger.assert(error.localizedDescription)
                        return Just("").eraseToAnyPublisher()
                    }
                    .flatMap { (path: String) -> AnyPublisher<Image?, Never> in
                        Self.image(from: path, format: thumbnail.format)
                    }
                    .prepend(
                        miniThumbnail
                    )
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
        } else {
            return miniThumbnail
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    }

    private static func thumbnail(for data: Data?) -> AnyPublisher<Image?, Never> {
        guard let data = data else {
            logger.assert("No thumbnail")
            return Just(nil).eraseToAnyPublisher()
        }
        return Deferred {
            Just(Image.image(from: data))
        }
        .subscribe(on: DispatchQueue.global())
        .eraseToAnyPublisher()
    }

    private func image(
        for fileId: FileId, format: ThumbnailState.Thumbnail.Format
    ) -> AnyPublisher<Image?, Never> {
        chatService.download(file: fileId)
            .catch { (error: Swift.Error) -> AnyPublisher<String, Never> in
                logger.assert(error.localizedDescription)
                return Just("").eraseToAnyPublisher()
            }
            .flatMap { (path: String) -> AnyPublisher<Image?, Never> in
                Self.image(from: path, format: format)
            }
            .eraseToAnyPublisher()
    }

    private static func image(
        from path: String, format: ThumbnailState.Thumbnail.Format
    ) -> AnyPublisher<Image?, Never> {
        Deferred {
            Just(Image.image(from: path, format: format))
        }
        .subscribe(on: DispatchQueue.global())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

private extension Image {
    static func image(from path: String, format: ThumbnailState.Thumbnail.Format) -> Image? {
        switch format {
        case .jpg,
             .png,
             .gif: // TODO: check GIF
            let fileURL = URL(fileURLWithPath: path)
            guard
                let data = try? Data(contentsOf: fileURL),
                let uiImage = UIImage(data: data)
            else {
                assertionFailure("Can't read image from: \(path)")
                return nil
            }
            return Image(uiImage: uiImage)

        case .webp:
            // TODO:
            assertionFailure("unsupported")
            return nil
        case .tgs:
            assertionFailure("unsupported")
            return nil
        case .mpeg4:
            assertionFailure("unsupported")
            return nil
        }
    }

    static func image(from data: Data) -> Image? {
        guard let uiImage = UIImage(data: data) else {
            assertionFailure("Can't create image from thumbnail data")
            return nil
        }
        return Image(uiImage: uiImage)
    }
}
