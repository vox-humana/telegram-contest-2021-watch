import Foundation

public typealias MessageId = Int64

public enum Sender: Hashable {
    case unknown
    case user(userId: Int)
    case chat(chatId: Int)
}

enum MessageRawType: String {
    // Supported
    case messageText
    case messageLocation
    case messageVideoNote
    case messageVideo
    case messagePhoto
    case messagePoll
    case messageSticker
    case messageAnimation
    case messageAudio
    case messageContact

    // Known, unsupported
    case messageSupergroupChatCreate
    case messageDocument
    case messageChatAddMembers
    case messageChatDeleteMember
    case messageContactRegistered
    case messageCustomServiceAction
    case messageChatChangeTitle
    case messageCall
    case messageExpiredPhoto

    case unknown
}

public enum MessageContent: Hashable {
    case text(String)
    case location(Location)
    case videoNote(VideoNote)
    case photo(Photo)

    case unsupported
}

public struct Message: Hashable {
    public let id: MessageId
    // preview text for last message rendering
    public let text: String
    public let content: MessageContent
    public let date: Date
    public let sender: Sender
    public let outgoing: Bool
}

extension Message: JSONDecodable {
    public init(json: [String: Any]) {
        json.checkType("message")

        id = json.unwrap("id")

        let jsonContent: JSON = json.unwrap("content")
        let rawType: String = jsonContent.unwrap("@type")
        let type = MessageRawType(rawValue: rawType) ?? .unknown
        if type == .unknown {
            print("Unknown type \(rawType)")
        }

        text = type.contentTextOrPlaceholder(from: jsonContent)
        let timestamp: Int64 = json.unwrap("date")
        date = Date(timeIntervalSince1970: TimeInterval(timestamp))

        let senderJson: JSON = json.unwrap("sender")
        sender = Sender(json: senderJson)

        outgoing = json.unwrap("is_outgoing")

        content = MessageContent(content: jsonContent)
    }
}

private extension MessageContent {
    init(content: JSON) {
        let rawType: String = content.unwrap("@type")
        let type = MessageRawType(rawValue: rawType) ?? .unknown
        switch type {
        case .messageText:
            let text = content.unwrap("text").extractMessageText()
            self = .text(text)
        case .messageLocation:
            let location = Location(json: content.unwrap("location"))
            self = .location(location)
        case .messageVideoNote:
            let videoNote = VideoNote(json: content.unwrap("video_note"))
            self = .videoNote(videoNote)
        case .messagePhoto:
            let photo = Photo(json: content.unwrap("photo"))
            self = .photo(photo)

        // TODO: support
        case .messageVideo:
            self = .unsupported
        case .messagePoll:
            self = .unsupported
        case .messageSticker:
            self = .unsupported
        case .messageAnimation:
            self = .unsupported
        case .messageAudio:
            self = .unsupported
        case .messageContact:
            self = .unsupported

        // Known, unsupported
        case .messageSupergroupChatCreate:
            self = .unsupported
        case .messageDocument:
            self = .unsupported
        case .messageChatAddMembers:
            self = .unsupported
        case .messageChatDeleteMember:
            self = .unsupported
        case .messageContactRegistered:
            self = .unsupported
        case .messageCustomServiceAction:
            self = .unsupported
        case .messageChatChangeTitle:
            self = .unsupported
        case .messageCall:
            self = .unsupported
        case .messageExpiredPhoto:
            self = .unsupported
        case .unknown:
            self = .unsupported
        }
    }
}

private extension MessageRawType {
    func contentTextOrPlaceholder(from content: JSON) -> String {
        // TODO: replace with `MessageContent` and caption extractions
        // to use caption in message cell
        // var placeholder { type_emoji? + caption? }
        switch self {
        case .messageVideo:
            return "🎥 video"
        case .messageText:
            return content.unwrap("text").extractMessageText()
        case .messagePhoto:
            return "📷 " + content.unwrap("caption").extractMessageText()
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
            return "🎥 animation"
        case .messageCustomServiceAction:
            return content.extractMessageText()
        case .messageChatChangeTitle:
            return "➡" + content.unwrap("title")
        case .messageAudio:
            return "🎵" + content.unwrap("caption").extractMessageText()
        case .messageVideoNote:
            return "🎥 videonote"
        case .messageCall:
            return "📞"
        case .messageContact:
            return "👤"
        case .messageExpiredPhoto:
            return "⌛️"
        case .messageLocation:
            return "🌏 location"
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
