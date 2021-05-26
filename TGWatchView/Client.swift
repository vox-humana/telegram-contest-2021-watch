

public enum AuthState {
    case initial
    case confirmationWaiting(link: String)
    case passwordWaiting
    case passwordSent
    case authorized
}

// TODO: rename to ChatListService
public protocol FileLoader {
    func downloadPhoto(for chat: Chat)
}

import Combine

public typealias ChatId = Int64
public typealias MessageId = Int64

public protocol HistoryService {
    func chatHistory(_ chatId: ChatId, from: MessageId, limit: Int) -> AnyPublisher<[Message], Never>
}

public struct DummyService: FileLoader, HistoryService {
    private let chatHistory: [Message]

    public init(chatHistory: [Message] = []) {
        self.chatHistory = chatHistory
    }

    public func downloadPhoto(for _: Chat) {}

    public func chatHistory(_: ChatId, from _: MessageId, limit _: Int) -> AnyPublisher<[Message], Never> {
        Just(chatHistory).eraseToAnyPublisher()
    }
}
