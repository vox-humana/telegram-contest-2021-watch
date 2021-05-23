import Foundation

public typealias MessageId = Int64

public enum Sender: Hashable {
    case unknown
    case user(userId: Int)
    case chat(chatId: Int)
}

public enum MessageType: String {
    case messageVideo
    case messageText
    case messagePhoto
    case messagePoll
    case messageSupergroupChatCreate
    case messageDocument
    case messageChatAddMembers
    case messageChatDeleteMember
    case messageContactRegistered
    case messageSticker
    case messageAnimation
    case messageCustomServiceAction
    case messageChatChangeTitle
    case messageAudio
    case messageVideoNote
    case messageCall
    case messageContact
    case messageExpiredPhoto

    case messageLocation

    case unknown
}

public struct Message: Hashable {
    public let id: MessageId
    public let type: MessageType
    public let text: String
    public let date: Date
    public let sender: Sender
    public let outgoing: Bool
}

extension Message: JSONDecodable {
    public init(json: [String: Any]) {
        json.checkType("message")

        id = json.unwrap("id")

        let content: JSON = json.unwrap("content")
        let rawType: String = content.unwrap("@type")
        type = MessageType(rawValue: rawType) ?? .unknown

        text = type.contentTextOrPlaceholder(from: content)
        let timestamp: Int64 = json.unwrap("date")
        date = Date(timeIntervalSince1970: TimeInterval(timestamp))

        let senderJson: JSON = json.unwrap("sender")
        sender = Sender(json: senderJson)

        outgoing = json.unwrap("is_outgoing")

        if type == .unknown {
            print("Unknown type \(rawType)")
        }
    }
}

private extension MessageType {
    func contentTextOrPlaceholder(from content: JSON) -> String {
        switch self {
        case .messageVideo:
            return "🎥video"
        case .messageText:
            return content.unwrap("text").extractMessageText()
        case .messagePhoto:
            return content.unwrap("caption").extractMessageText()
        case .messagePoll:
            return "📊"
        case .messageSupergroupChatCreate:
            return "Channel created"
        case .messageDocument:
            return "📎" + content.unwrap("caption").extractMessageText()
        case .messageChatAddMembers:
            return "+👤"
        case .messageChatDeleteMember:
            return "-👤"
        case .messageContactRegistered:
            return "👤"
        case .messageSticker:
            return content.unwrap("sticker").extractStickerEmoji()
        case .messageAnimation:
            return "🎥animation"
        case .messageCustomServiceAction:
            return content.extractMessageText()
        case .messageChatChangeTitle:
            return "➡" + content.unwrap("title")
        case .messageAudio:
            return "🎵" + content.unwrap("caption").extractMessageText()
        case .messageVideoNote:
            let videoNote = VideoNote(json: content["video_note"])
            return "🎥videonote"
        case .messageCall:
            return "📞"
        case .messageContact:
            return "👤"
        case .messageExpiredPhoto:
            return "⌛️"

        case .messageLocation:
            // TODO: Location
            return "🌏"
        case .unknown:
            return "🖼"
        }
    }
}

private extension JSON {
    func extractMessageText() -> String {
        unwrap("text")
    }

    func extractStickerEmoji() -> String {
        unwrap("emoji")
    }
}

extension Sender: JSONDecodable {
    public init(json: [String: Any]) {
        // TODO: other types?
        let senderType: String = json.unwrap("@type")
        if senderType == "messageSenderUser" {
            self = .user(userId: json.unwrap("user_id"))
            return
        }

        if senderType == "messageSenderChat" {
            self = .chat(chatId: json.unwrap("chat_id"))
            return
        }

        assertionFailure("Unknown sender type")
        self = .unknown
    }
}

public extension Sender {}
