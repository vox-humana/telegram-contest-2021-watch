import Combine
import SwiftUI

public typealias UserId = Int
public typealias ChatId = Int64
public typealias MessageId = Int64
public typealias FileId = Int

public enum AuthState {
    case initial
    case confirmationWaiting(link: String)
    case passwordWaiting
    case passwordSent
    case authorized
}

public protocol AuthService {
    func sendAuthentication(password: String)
    var authStateSignal: AnyPublisher<AuthState, Never> { get }
}

struct DummyAuthService: AuthService {
    let state: AuthState

    func sendAuthentication(password _: String) {}

    var authStateSignal: AnyPublisher<AuthState, Never> {
        Just(state).eraseToAnyPublisher()
    }
}

public protocol ChatService {
    func chatHistory(_ chatId: ChatId, from: MessageId, limit: Int, forward: Bool) -> AnyPublisher<(MessageId, [MessageState]), Error>
    func send(_ message: String, to chat: ChatId) -> AnyPublisher<MessageId, Error>
    func newMessages(_ chatId: ChatId) -> AnyPublisher<MessageState, Never>
    func download(file: FileId) -> AnyPublisher<String, Swift.Error>
}

public struct DummyChatService: ChatService {
    public init() {}

    public func chatHistory(_: ChatId, from _: MessageId, limit _: Int, forward _: Bool) -> AnyPublisher<(MessageId, [MessageState]), Error> {
        Just((MessageId(0), [])).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    public func send(_: String, to _: ChatId) -> AnyPublisher<MessageId, Error> {
        Just(MessageId(0)).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    public func newMessages(_: ChatId) -> AnyPublisher<MessageState, Never> {
        Empty().eraseToAnyPublisher()
    }

    public func download(file _: FileId) -> AnyPublisher<String, Error> {
        Just("").setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}

public struct ChatServiceEnvironment: EnvironmentKey {
    public static var defaultValue: ChatService = DummyChatService()
}

public extension EnvironmentValues {
    var chatService: ChatService {
        get { self[ChatServiceEnvironment.self] }
        set { self[ChatServiceEnvironment.self] = newValue }
    }
}

public protocol ChatMessageSender {
    func sendMessage(_ text: String)
    func sendLocation(_ location: CLLocationCoordinate2D)
}

public struct DummyMessageSender: ChatMessageSender {
    public init() {}

    public func sendMessage(_: String) {}
    public func sendLocation(_: CLLocationCoordinate2D) {}
}

public struct ChatMessageSenderEnvironment: EnvironmentKey {
    public static var defaultValue: ChatMessageSender = DummyMessageSender()
}

public extension EnvironmentValues {
    var messageSender: ChatMessageSender {
        get { self[ChatMessageSenderEnvironment.self] }
        set { self[ChatMessageSenderEnvironment.self] = newValue }
    }
}
