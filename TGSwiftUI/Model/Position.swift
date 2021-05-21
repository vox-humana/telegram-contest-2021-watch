public enum ChatListType {
    case unknown
    case main
    // case filter(Int)
}

public struct Position: Hashable {
    public let list: ChatListType
    public let isPinned: Bool
    public let order: Int64
}

extension Position: JSONDecodable {
    public init(json: [String: Any]) {
        json.checkType("chatPosition")

        isPinned = json.unwrap("is_pinned")

        let orderString: String = json.unwrap("order") // :Why:
        order = Int64(orderString)!

        let listJSON: JSON = json.unwrap("list")
        let listType: String = listJSON.unwrap("@type")
        list = listType == "chatListMain" ? .main : .unknown
    }
}
