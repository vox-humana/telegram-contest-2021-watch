import Foundation

public typealias MessageId = Int64

public enum Sender: Hashable {
    case unknown
    case user(userId: Int)
    case chat(chatId: Int)
}

public struct Message: Hashable {
    public let id: MessageId
    public let text: String
    public let date: Date
    public let sender: Sender
    public let outgoing: Bool
}

extension Message: JSONDecodable {
    public init(json: [String: Any]) {
        json.checkType("message")

        id = json.unwrap("id")
        text = json.extractContentTextOrPlaceholder()
        let timestamp: Int64 = json.unwrap("date")
        date = Date(timeIntervalSince1970: TimeInterval(timestamp))

        let senderJson: JSON = json.unwrap("sender")
        sender = Sender(json: senderJson)

        outgoing = json.unwrap("is_outgoing")
    }
}

private extension JSON {
    func extractContentTextOrPlaceholder() -> String {
        let content: JSON = unwrap("content")
        let type: String = content.unwrap("@type")
        if type == "messageVideo" {
            return "🎥video"
        }
        if type == "messageText" {
            return content.unwrap("text").extractMessageText()
        }

        if type == "messagePhoto" {
            return content.unwrap("caption").extractMessageText()
        }

        if type == "messagePoll" {
            return "📊"
        }

        if type == "messageSupergroupChatCreate" {
            return "Channel created"
        }

        if type == "messageDocument" {
            return "📎" + content.unwrap("caption").extractMessageText()
        }

        if type == "messageChatAddMembers" {
            return "+👤"
        }

        if type == "messageChatDeleteMember" {
            return "-👤"
        }

        if type == "messageContactRegistered" {
            return "👤"
        }

        if type == "messageSticker" {
            return content.unwrap("sticker").extractStickerEmoji()
        }

        if type == "messageAnimation" {
            return "🎥animation"
        }

        if type == "messageCustomServiceAction" {
            return content.extractMessageText()
        }

        logger.debug("Unsupported content: \(content)")
        return "🖼"
    }

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

        logger.assert("Unknown sender type")
        self = .unknown
    }
}

public extension Sender {}
