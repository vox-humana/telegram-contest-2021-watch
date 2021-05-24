import Foundation

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
    public var icon: ChatIcon
    public var lastMessage: Message?
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
        lastMessage = nil

        if let photoJson = json["photo"] as? JSON {
            icon = ChatIcon(chatJson: photoJson)
        } else {
            icon = ChatIcon(smallFile: nil)
        }

        // TODO:
        unread = false
    }
}

public struct ChatIcon: Hashable {
    public var smallFile: File?
}

public extension ChatIcon {
    init(chatJson: [String: Any]) {
        guard !chatJson.isEmpty else {
            smallFile = nil
            return
        }
        chatJson.checkType("chatPhotoInfo")
        smallFile = File(json: chatJson.unwrap("small"))
    }
}
