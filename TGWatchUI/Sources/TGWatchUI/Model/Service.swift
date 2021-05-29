import Combine
import SwiftUI

public typealias UserId = Int
public typealias ChatId = Int64
public typealias MessageId = Int64

public protocol ChatService {
    func chatHistory(_ chatId: ChatId, from: MessageId, limit: Int) -> AnyPublisher<(MessageId, [MessageState]), Error>
    func send(_ message: String, to chat: ChatId) -> AnyPublisher<MessageId, Error>
}

public struct DummyChatService: ChatService {
    public init() {}

    public func chatHistory(_: ChatId, from _: MessageId, limit _: Int) -> AnyPublisher<(MessageId, [MessageState]), Error> {
        Just((MessageId(0), [])).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    public func send(_: String, to _: ChatId) -> AnyPublisher<MessageId, Error> {
        Just(MessageId(0)).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}

// TODO: move out
public struct ChatServiceEnvironment: EnvironmentKey {
    public static var defaultValue: ChatService = DummyChatService()
}

public extension EnvironmentValues {
    var chatService: ChatService {
        get { self[ChatServiceEnvironment.self] }
        set { self[ChatServiceEnvironment.self] = newValue }
    }
}
