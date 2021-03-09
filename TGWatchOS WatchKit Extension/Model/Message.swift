import Foundation

typealias MessageId = Int64

struct Message {
    let id: MessageId
    let text: String
    let date: Date
}

extension Message: JSONDecodable {
    init(json: [String: Any]) {
        json.checkType("message")
        
        id = json.unwrap("id")
        text = json.extractContentTextOrPlaceholder()
        let timestamp: Int64 = json.unwrap("date")
        date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
}

private extension JSON {
    func extractContentTextOrPlaceholder() -> String {
        let content: JSON = self.unwrap("content")
        let type: String = content.unwrap("@type")
        if type == "messageVideo" {
            return "video"
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

        logger.debug("Unsupported content: \(content)")
        return "🖼"
    }
    
    func extractMessageText() -> String {
        self.unwrap("text")
    }
}

