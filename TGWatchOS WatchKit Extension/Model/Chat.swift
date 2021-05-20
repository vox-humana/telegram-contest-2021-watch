import Foundation
import UIKit

enum ChatType: String, Equatable {
    case chat
    case chatTypeSecret
    case chatTypeBasicGroup
    case chatTypeSupergroup
    case chatTypePrivate
}

typealias ChatId = Int64

struct Chat: Hashable, Identifiable {
    let id: ChatId
    let type: ChatType
    let title: String
    var icon: Photo
    var lastMessage: Message
    let unreadCount: Int
    var position: Int64 = 0
}

extension Chat: JSONDecodable {
    init(json: [String: Any]) {
        let typeDict = json["type"] as! [String: Any]
        type = ChatType(rawValue: typeDict.unwrap("@type"))!

        id = json.unwrap("id")
        title = json.unwrap("title")
        unreadCount = json.unwrap("unread_count")
        lastMessage = .init(id: -1, text: "[TBD]", date: Date().addingTimeInterval(-3 * 60))

        if let photoJson = json["photo"] as? JSON {
            icon = Photo(json: photoJson)
        } else {
            icon = Photo(smallFile: nil)
        }
    }
}

extension Photo: JSONDecodable {
    init(json: [String: Any]) {
        guard !json.isEmpty else {
            smallFile = nil
            return
        }
        json.checkType("chatPhotoInfo")
        smallFile = File(json: json.unwrap("small"))
    }
}
