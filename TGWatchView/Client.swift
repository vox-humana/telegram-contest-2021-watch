import Combine
import SwiftUI

public enum AuthState {
    case initial
    case confirmationWaiting(link: String)
    case passwordWaiting
    case passwordSent
    case authorized
}

public protocol ChatListService {
    func downloadPhoto(for chat: Chat)
    func requestChatList()
    var chatListSignal: CurrentValueSubject<[Chat], Never> { get }
}

public protocol HistoryService {
    func chatHistory(_ chatId: ChatId, from: MessageId, limit: Int) -> AnyPublisher<[Message], Never>
}

struct ChatListServiceEnvironment: EnvironmentKey {
    static var defaultValue: ChatListService = DummyService()
}

struct HistoryServiceEnvironment: EnvironmentKey {
    static var defaultValue: HistoryService = DummyService()
}

extension EnvironmentValues {
    var chatListService: ChatListService {
        get { self[ChatListServiceEnvironment.self] }
        set { self[ChatListServiceEnvironment.self] = newValue }
    }
}

public extension EnvironmentValues {
    var historyService: HistoryService {
        get { self[HistoryServiceEnvironment.self] }
        set { self[HistoryServiceEnvironment.self] = newValue }
    }
}

public typealias ChatId = Int64
public typealias MessageId = Int64

public struct DummyService: ChatListService, HistoryService {
    private let chatHistory: [Message]

    public let chatListSignal = CurrentValueSubject<[Chat], Never>([])

    public init(chatHistory: [Message] = []) {
        self.chatHistory = chatHistory
    }

    public func requestChatList() {}

    public func downloadPhoto(for _: Chat) {}

    public func chatHistory(_: ChatId, from _: MessageId, limit _: Int) -> AnyPublisher<[Message], Never> {
        Just(chatHistory).eraseToAnyPublisher()
    }
}
