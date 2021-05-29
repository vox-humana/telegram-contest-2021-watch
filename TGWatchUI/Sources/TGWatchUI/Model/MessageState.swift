import Foundation

public enum MessageContentState {
    case text(String)
    case location(LocationState)
    case videoNote(VideoNoteState)
    case photo(PhotoState)
    case video(VideoState)
    case contact(ContactState)
    case document(DocumentState)
    case audio(AudioState)
}

public struct UserState {
    public init(id: UserId, firstName: String, lastName: String, photo: LocalPhotoState?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.photo = photo
    }

    let id: UserId
    let firstName: String
    let lastName: String
    let photo: LocalPhotoState?
}

extension UserState {
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

public enum MessageSenderState {
    case user(UserState)
    case chat(ChatState)
}

public struct ChatState {
    public init(id: ChatId, title: String, photo: LocalPhotoState?, lastMessageText: String) {
        self.id = id
        self.title = title
        self.photo = photo
        self.lastMessageText = lastMessageText
    }

    let id: ChatId
    let title: String
    let photo: LocalPhotoState?
    let lastMessageText: String
}

public struct MessageState {
    public init(id: MessageId, chatId: ChatId, content: MessageContentState, sender: MessageSenderState, date: Date, isOutgoing: Bool) {
        self.id = id
        self.chatId = chatId
        self.content = content
        self.sender = sender
        self.date = date
        self.isOutgoing = isOutgoing
    }

    public let id: MessageId
    public let chatId: ChatId
    public let content: MessageContentState
    public let sender: MessageSenderState
    public let date: Date
    public let isOutgoing: Bool
}

public extension MessageContentState {
    var hiddenBackground: Bool {
        switch self {
        case let .text(text) where EmojiContentView.canRender(text):
            return true
        case .videoNote:
            return true
        default:
            return false
        }
    }
}

public extension Array where Element == MessageState {
    static let preview: [MessageState] = [
        .init(
            id: 0,
            chatId: 1,
            content: .text("Any gift ideas for mom? 🎁"),
            sender: .user(.preview),
            date: Date(),
            isOutgoing: false
        ),
        .init(
            id: 2,
            chatId: 1,
            content: .text("A dog!"),
            sender: .user(.preview),
            date: Date(),
            isOutgoing: true
        ),
        .init(
            id: 3,
            chatId: 1,
            content: .photo(.withoutCaption),
            sender: .user(.preview),
            date: Date(),
            isOutgoing: true
        ),
    ]
}

extension UserState {
    static let preview = UserState(
        id: 1,
        firstName: "Alicia",
        lastName: "Torreaux",
        photo: .init(file: .userAvatar, minithumbnail: nil)
    )
}