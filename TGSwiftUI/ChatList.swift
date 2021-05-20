import Combine
import SwiftUI

public struct ChatListView: View {
    @ObservedObject var vm: ChatListViewModel
    
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
                ChatCellView(chat: chat) { chat in
                    self.vm.fileLoader.downloadPhoto(for: chat)
                }
                .listRowInsets(EdgeInsets())
            }
        }
        .navigationBarTitle("Charts")
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

struct UnreadBadge: View {
    let count: Int
    var body: some View {
        Text("\(count)")
            .font(.tgBadgeCount)
            .padding(3)
            .background(
                Circle().fill(Color.accentColor)
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
    let photo: Photo
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

    public init(fileLoader: FileLoader, listPublisher: AnyPublisher<[Chat], Never>) {
        self.fileLoader = fileLoader
        subscription = listPublisher.receive(on: DispatchQueue.main).sink { [weak self] chats in
            self?.list = chats
        }
    }
}

struct LocalPhotoView: View {
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
        image.resizable()
    }

    init(file: File?) {
        _loader = ObservedObject(wrappedValue: LocalLoader(file: file))
    }

    private var image: Image {
        if let image = loader.image {
            return image
        } else {
            return Image(systemName: "person")
        }
    }
}
