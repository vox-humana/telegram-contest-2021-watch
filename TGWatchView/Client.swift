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

protocol ChatListService {
    func downloadPhoto(for chat: Chat)
    func requestChatList()
    var chatListSignal: CurrentValueSubject<[Chat], Never> { get }
}

struct ChatListServiceEnvironment: EnvironmentKey {
    static var defaultValue: ChatListService = DummyService()
}

extension EnvironmentValues {
    var chatListService: ChatListService {
        get { self[ChatListServiceEnvironment.self] }
        set { self[ChatListServiceEnvironment.self] = newValue }
    }
}

struct DummyService: ChatListService {
    private let chatHistory: [Message]

    let chatListSignal = CurrentValueSubject<[Chat], Never>(.preview())

    init(chatHistory: [Message] = []) {
        self.chatHistory = chatHistory
    }

    func requestChatList() {}

    func downloadPhoto(for _: Chat) {}
}
