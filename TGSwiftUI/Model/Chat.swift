import Foundation
import UIKit

public enum ChatType: String, Equatable {
    case chat
    case chatTypeSecret
    case chatTypeBasicGroup
    case chatTypeSupergroup
    case chatTypePrivate
}

public typealias ChatId = Int64

public struct Chat: Hashable, Identifiable {
    public let id: ChatId
    public let type: ChatType
    public let title: String
    public var icon: Photo
    public var lastMessage: Message
    public let unreadCount: Int
    public let unread: Bool
    public var position: Int64 = 0
}

extension Chat: JSONDecodable {
    public init(json: [String: Any]) {
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
        
        // TODO:
        unread = false
    }
}

extension Photo: JSONDecodable {
    public init(json: [String: Any]) {
        guard !json.isEmpty else {
            smallFile = nil
            return
        }
        json.checkType("chatPhotoInfo")
        smallFile = File(json: json.unwrap("small"))
    }
}
