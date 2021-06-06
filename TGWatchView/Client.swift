import Combine
import SwiftUI
import TGWatchUI // TODO: extract model

protocol ChatListService {
    func downloadPhoto(for chat: Chat)
    func requestChatList()
    var chatListSignal: AnyPublisher<[Chat], Never> { get }
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

    var chatListSignal: AnyPublisher<[Chat], Never> {
        Just([Chat].preview()).eraseToAnyPublisher()
    }

    init(chatHistory: [Message] = []) {
        self.chatHistory = chatHistory
    }

    func requestChatList() {}

    func downloadPhoto(for _: Chat) {}
}
