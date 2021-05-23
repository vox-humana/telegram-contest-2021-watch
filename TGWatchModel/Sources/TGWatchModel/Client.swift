public enum AuthState {
    case initial
    case confirmationWaiting(link: String)
    case passwordWaiting
    case passwordSent
    case authorized
}

public protocol FileLoader {
    // var loadingStream: AnyPublisher<File>
    func downloadPhoto(for chat: Chat)
    // func downloadPhoto(for user: User)
}

import Combine

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
