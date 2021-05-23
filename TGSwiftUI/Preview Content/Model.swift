import Combine
import Foundation

struct FakeService: FileLoader, HistoryService {
    func downloadPhoto(for _: Chat) {}

    func chatHistory(_: ChatId, from _: MessageId, limit _: Int) -> AnyPublisher<[Message], Never> {
        Just([Message].fake()).eraseToAnyPublisher()
    }
}

extension Array where Element == Chat {
    static func fake() -> [Chat] {
        [
            .init(
                id: 0,
                type: .chatTypePrivate,
                title: "Alicia Torreaux",
                icon: Photo(smallFile: .userAvatar),
                lastMessage: .init(
                    id: 1,
                    text: "🥰Sticker",
                    date: Date(),
                    sender: .user(userId: 1),
                    outgoing: false
                ),
                unreadCount: 0,
                unread: true
            ),
            .init(
                id: 1,
                type: .chatTypeSupergroup,
                title: "Digital Nomads",
                icon: Photo(smallFile: nil),
                lastMessage: .init(
                    id: 3,
                    text: "We just reached",
                    date: Date().addingTimeInterval(-3 * 60),
                    sender: .user(userId: 2),
                    outgoing: false
                ),
                unreadCount: 6,
                unread: false
            ),
            .init(
                id: 2,
                type: .chatTypeSecret,
                title: "James",
                icon: Photo(smallFile: nil),
                lastMessage: .init(
                    id: 2,
                    text: "I'm good thank you!",
                    date: Date().addingTimeInterval(-3 * 60),
                    sender: .user(userId: 3),
                    outgoing: false
                ),
                unreadCount: 0,
                unread: true
            ),
        ]
    }
}

extension Array where Element == Message {
    static func fake() -> [Message] {
        [
            .init(
                id: 0,
                text: "Any gift ideas for mom? 🎁",
                date: Date(),
                sender: .user(userId: 1),
                outgoing: false
            ),
            .init(
                id: 0,
                text: "A dog!",
                date: Date(),
                sender: .user(userId: 2),
                outgoing: true
            ),
        ]
    }
}

extension File {
    static let userAvatar: File = .init(id: 1, path: imagePath("user-avatar"), downloaded: true, size: 0)
    private static func imagePath(_ name: String) -> String {
        "\(Bundle(for: LoginViewModel.self).bundlePath)/\(name).png"
    }
}

extension User {
    static let profile = User(
        id: 0,
        photo: .init(smallFile: .userAvatar),
        name: "Alicia",
        phone: "123456789"
    )
}
