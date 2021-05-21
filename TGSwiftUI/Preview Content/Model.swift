import Foundation

struct FakeFileLoader: FileLoader {
    func downloadPhoto(for _: Chat) {}
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
                    date: Date()
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
                    date: Date().addingTimeInterval(-3 * 60)
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
                    date: Date().addingTimeInterval(-3 * 60)
                ),
                unreadCount: 0,
                unread: true
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
