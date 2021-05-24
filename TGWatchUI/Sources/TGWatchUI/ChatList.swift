import Combine
import SwiftUI
import TGWatchModel

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
        .navigationBarTitle("Chats")
    }
}

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

struct AvatarView: View {
    let photo: ChatIcon
    private let size: CGFloat = 24

    var body: some View {
        LocalPhotoView(file: photo.smallFile)
            .frame(width: size, height: size)
            .cornerRadius(size / 2)
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

struct LocalPhotoView: View {
    let placeholderName: String

    private class LocalLoader: ObservableObject {
        var image: Image?

        init(file: File?) {
            guard let file = file, file.downloaded else {
                return
            }
            let fileURL = URL(fileURLWithPath: file.path)

            // background?
            guard
                let data = try? Data(contentsOf: fileURL),
                let uiImage = UIImage(data: data)
            else {
                assertionFailure("Can't read image from: \(file.path)")
                return
            }

            image = Image(uiImage: uiImage)
            objectWillChange.send()
        }
    }

    @ObservedObject private var loader: LocalLoader

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

    init(file: File?, placeholderName: String = "person") {
        _loader = ObservedObject(wrappedValue: LocalLoader(file: file))
        self.placeholderName = placeholderName
    }

    private var image: Image {
        if let image = loader.image {
            return image
        } else {
            return Image(systemName: placeholderName)
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
