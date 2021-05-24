import Combine
import Foundation

#if DEBUG
    public extension Array where Element == Chat {
        static func fake() -> [Chat] {
            [
                .init(
                    id: 0,
                    type: .chatTypePrivate,
                    title: "Alicia Torreaux",
                    icon: ChatIcon(smallFile: .userAvatar),
                    lastMessage: .init(
                        id: 1,
                        text: "🥰Sticker",
                        content: .unsupported,
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
                    icon: ChatIcon(smallFile: nil),
                    lastMessage: .init(
                        id: 3,
                        text: "We just reached",
                        content: .text("We just reached"),
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
                    icon: ChatIcon(smallFile: nil),
                    lastMessage: .init(
                        id: 2,
                        text: "I'm good thank you!",
                        content: .text("I'm good thank you!"),
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

    public extension Array where Element == Message {
        static func fake() -> [Message] {
            [
                .init(
                    id: 0,
                    text: "Any gift ideas for mom? 🎁",
                    content: .text("Any gift ideas for mom? 🎁"),
                    date: Date(),
                    sender: .user(userId: 1),
                    outgoing: false
                ),
                .init(
                    id: 1,
                    text: "A dog!",
                    content: .text("A dog!"),
                    date: Date(),
                    sender: .user(userId: 2),
                    outgoing: true
                ),
                .init(
                    id: 2,
                    text: "Location",
                    content: .location(.init(latitude: 60.0, longitude: 30.0)),
                    date: Date(),
                    sender: .user(userId: 2),
                    outgoing: true
                ),
            ]
        }
    }

    extension File {
        static let userAvatar: File = .init(id: 1, path: imagePath("user-avatar.png"), downloaded: true, size: 0)

        static let photo: File = .init(id: 1, path: imagePath("Image.png"), downloaded: true, size: 0)

        private static func imagePath(_ filename: String) -> String {
            URL(fileURLWithPath: #file)
                .deletingLastPathComponent()
                .deletingLastPathComponent()
                .deletingLastPathComponent()
                .appendingPathComponent("Preview Content")
                .appendingPathComponent(filename)
                .path
        }
    }

    public extension User {
        static let profile = User(
            id: 0,
            photo: .init(smallFile: .userAvatar),
            name: "Alicia",
            phone: "123456789"
        )
    }

    public extension Photo {
        static let photo = Photo(
            minithumbnail: nil,
            sizes: [
                PhotoSize(type: "m", width: 320, height: 240, photo: .photo),
            ]
        )
    }

#endif
