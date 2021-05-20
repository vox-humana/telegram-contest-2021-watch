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
                icon: Photo(smallFile: nil),
                lastMessage: .init(
                    id: 1,
                    text: "🥰Sticker",
                    date: Date()
                ),
                unreadCount: 0
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
                unreadCount: 6
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
                unreadCount: 0
            ),
        ]
    }
}
