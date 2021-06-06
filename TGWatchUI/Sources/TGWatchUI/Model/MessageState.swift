import Foundation

public enum MessageContentState: Hashable {
    case text(String)
    case location(LocationState)
    case videoNote(VideoNoteState)
    case photo(PhotoState)
    case video(VideoState)
    case contact(ContactState)
    case document(DocumentState)
    case audio(AudioState)
    case sticker(StickerState)
    case poll(PollState)
}

public struct UserState: Hashable {
    public init(id: UserId, firstName: String, lastName: String, photo: ThumbnailState?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.photo = photo
    }

    let id: UserId
    let firstName: String
    let lastName: String
    let photo: ThumbnailState?
}

extension UserState {
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

public enum MessageSenderState: Hashable {
    case user(UserState)
    case chat(ChatState)
}

public struct ChatState: Hashable {
    public init(id: ChatId, title: String, photo: ThumbnailState?, unreadCount: Int, unreadMentionCount: Int, lastMessageText: String, lastMessageDate: Int?) {
        self.id = id
        self.title = title
        self.photo = photo
        self.unreadCount = unreadCount
        self.unreadMentionCount = unreadMentionCount
        self.lastMessageText = lastMessageText
        self.lastMessageDate = lastMessageDate
    }

    public let id: ChatId
    public let title: String
    public let photo: ThumbnailState?
    public let unreadCount: Int
    public let unreadMentionCount: Int
    public let lastMessageText: String
    public let lastMessageDate: Int?
}

public struct MessageReplyState: Hashable {
    public init(sender: MessageSenderState, content: String) {
        self.sender = sender
        self.content = content
    }

    let sender: MessageSenderState
    let content: String
}

public struct MessageState: Hashable {
    public init(id: MessageId, chatId: ChatId, content: MessageContentState, sender: MessageSenderState, date: Date, isOutgoing: Bool, privateChat: Bool, reply: MessageReplyState?) {
        self.id = id
        self.chatId = chatId
        self.content = content
        self.sender = sender
        self.date = date
        self.isOutgoing = isOutgoing
        self.privateChat = privateChat
        self.reply = reply
    }

    public let id: MessageId
    public let chatId: ChatId
    public let content: MessageContentState
    public let sender: MessageSenderState
    public let date: Date
    public let isOutgoing: Bool
    public var privateChat: Bool
    public let reply: MessageReplyState?
}

public extension Array where Element == MessageState {
    static let preview: [MessageState] = [
        .init(
            id: 0,
            chatId: 1,
            content: .text("Any gift ideas for mom? 🎁"),
            sender: .user(.preview),
            date: Date(),
            isOutgoing: false,
            privateChat: false,
            reply: .init(sender: .user(.preview), content: "20K subscribers!")
        ),
        .init(
            id: 2,
            chatId: 1,
            content: .text("A dog!"),
            sender: .user(.preview),
            date: Date(),
            isOutgoing: true,
            privateChat: false,
            reply: nil
        ),
        .init(
            id: 5,
            chatId: 1,
            content: .audio(.preview),
            sender: .user(.preview),
            date: Date(),
            isOutgoing: true,
            privateChat: false,
            reply: .init(sender: .user(.preview), content: "Voice Message")
        ),
        .init(
            id: 3,
            chatId: 1,
            content: .photo(.withoutCaption),
            sender: .user(.preview),
            date: Date(),
            isOutgoing: true,
            privateChat: false,
            reply: nil
        ),
        .init(
            id: 4,
            chatId: 1,
            content: .videoNote(.unplayed),
            sender: .user(.preview),
            date: Date(),
            isOutgoing: true,
            privateChat: false,
            reply: nil
        ),
    ]
}

extension UserState {
    static let preview = UserState(
        id: 1,
        firstName: "Alicia",
        lastName: "Torreaux",
        photo: .previewAvatar
    )
}
