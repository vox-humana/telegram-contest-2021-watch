import Combine
import SwiftUI
import TGWatchUI // TODO: extract model

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

public struct ChatListServiceEnvironment: EnvironmentKey {
    public static var defaultValue: ChatListService = DummyService()
}

public extension EnvironmentValues {
    var chatListService: ChatListService {
        get { self[ChatListServiceEnvironment.self] }
        set { self[ChatListServiceEnvironment.self] = newValue }
    }
}

public struct DummyService: ChatListService {
    private let chatHistory: [Message]

    public let chatListSignal = CurrentValueSubject<[Chat], Never>(.preview())

    public init(chatHistory: [Message] = []) {
        self.chatHistory = chatHistory
    }

    public func requestChatList() {}

    public func downloadPhoto(for _: Chat) {}
}
