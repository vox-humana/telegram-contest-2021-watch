import Combine
import SwiftUI

struct ChatListView: View {
    @ObservedObject var vm: ChatListViewModel

    var body: some View {
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

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView(vm: .init(fileLoader: FakeFileLoader(), listPublisher: Just([Chat].fake()).eraseToAnyPublisher()))
    }
}

struct ChatCellView: View {
    let chat: Chat
    let downloadPhoto: (Chat) -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            AvatarView(photo: chat.icon)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                .onAppear {
                    self.downloadPhoto(chat)
                }

            VStack(alignment: .leading) {
                Text(chat.title)
                    .lineLimit(1)
                    .font(.tgChatTitle)
                    .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 0))
                Text(chat.lastMessage.text)
                    .lineLimit(1)
                    .font(.body)

                HStack(alignment: .top, spacing: 0) {
                    Text(DateFormatter.time(from: chat.lastMessage.date))
                        .font(.caption)
                    Spacer()
                    if chat.unreadCount > 0 {
                        UnreadBadge(count: chat.unreadCount)
                    }
                }
                .padding(EdgeInsets(top: 2, leading: 0, bottom: 4, trailing: 4))
            }
        }
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
            .background(
                Circle().fill(Color.accentColor).frame(width: 17, height: 17)
            )
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

final class ChatListViewModel: ObservableObject {
    @Published var list: [Chat] = []
    private var subscription: AnyCancellable?
    let fileLoader: FileLoader

    init(fileLoader: FileLoader, listPublisher: AnyPublisher<[Chat], Never>) {
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
