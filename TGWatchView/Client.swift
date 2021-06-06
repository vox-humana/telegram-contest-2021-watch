import Combine
import SwiftUI
import TGWatchUI // TODO: extract model

protocol ChatListService {
    func downloadPhoto(for chat: ChatState)
    func requestChatList()
    var chatListSignal: AnyPublisher<[Chat], Never> { get }
}

struct ChatListServiceEnvironment: EnvironmentKey {
    static var defaultValue: ChatListService = DummyChatListService()
}

extension EnvironmentValues {
    var chatListService: ChatListService {
        get { self[ChatListServiceEnvironment.self] }
        set { self[ChatListServiceEnvironment.self] = newValue }
    }
}

struct DummyChatListService: ChatListService {
    var chatListSignal: AnyPublisher<[Chat], Never> {
        Just([Chat].preview()).eraseToAnyPublisher()
    }

    func requestChatList() {}

    func downloadPhoto(for _: ChatState) {}
}
