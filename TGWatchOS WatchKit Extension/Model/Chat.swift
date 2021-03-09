import Foundation
import UIKit

enum ChatType: String {
    case chat
    case chatTypeSecret
    case chatTypeBasicGroup
    case chatTypeSupergroup
    case chatTypePrivate
}

typealias ChatId = Int64

struct Chat: Identifiable {
    let id: ChatId
    let type: ChatType
    let title: String
    let icon: UIImage
    var lastMessage: Message
    let unreadCount: Int
    var position: Int64 = 0
}

extension Array where Element == Chat {
    static func fake() -> [Chat] {
        [
            .init(
                id: 0,
                type: .chatTypePrivate,
                title: "Alicia Torreaux",
                icon: UIImage(systemName: "person")!,
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
                icon: UIImage(systemName: "person.2")!,
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
                icon: UIImage(systemName: "person")!,
                lastMessage: .init(
                    id: 2,
                    text: "I'm good thank you!",
                    date: Date().addingTimeInterval(-3 * 60)
                ),
                unreadCount: 0
            )
        ]
    }
}

extension Chat: JSONDecodable {
    init(json: [String: Any]) {
        let typeDict = json["type"] as! [String: Any]
        type = ChatType(rawValue: typeDict.unwrap("@type"))!
        
        id = json.unwrap("id")
        title = json.unwrap("title")
        unreadCount = json.unwrap("unread_count")
        lastMessage = .init(id: -1, text: "[TBD]", date: Date().addingTimeInterval(-3 * 60))
        icon = UIImage(systemName: "person")! // TBD
    }
}
