import Foundation

public typealias MessageId = Int64

public struct Message: Hashable {
    public let id: MessageId
    public let text: String
    public let date: Date
}

extension Message: JSONDecodable {
    public init(json: [String: Any]) {
        json.checkType("message")

        id = json.unwrap("id")
        text = json.extractContentTextOrPlaceholder()
        let timestamp: Int64 = json.unwrap("date")
        date = Date(timeIntervalSince1970: TimeInterval(timestamp))
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
