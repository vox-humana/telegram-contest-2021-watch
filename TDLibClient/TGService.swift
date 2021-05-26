import Combine
import Foundation

final class TGService {
    private let client = TDCLient()
    private let api: TdApi

    let chatListService: ChatListService
    let authService: AuthService

    init() {
        api = TdApi(client: client)
        chatListService = ChatListService(api: api)
        authService = AuthService(api: api)
    }

    func start() {
        logger.debug("initializing TG client")

        client.run { [weak self] data in
            guard let self = self else { return }
            do {
                let update = try self.api.decoder.decode(Update.self, from: data)
                try self.process(update: update)
            } catch {
                logger.assert(error.localizedDescription)
            }
        }

        #if DEBUG
            let query = SetLogVerbosityLevel(newVerbosityLevel: 3)
        #else
            let query = SetLogVerbosityLevel(newVerbosityLevel: 0)
        #endif
        client.execute(query: DTO(query))

        try? api.getOption(name: "version") { response in
            logger.debug(response)
        }
    }

    private func process(update: Update) throws {
        switch update {
        case let .updateConnectionState(state):
            logger.debug("Network state: \(state.state)")
        case let .updateAuthorizationState(state):
            if case .authorizationStateReady = state.authorizationState {
                self.chatListService.requestMainChatList()
            }
        default:
            break
        }

        chatListService.process(update: update)
        authService.process(update: update)
    }
}

// TODO: extract
extension TGService: HistoryService {
    func chatHistory(_ chatId: ChatId, from: MessageId, limit: Int = 20) -> AnyPublisher<[Message], Never> {
        Future<[Message], Never> { [api] promise in
            try? api.getChatHistory(
                chatId: chatId, fromMessageId: from, limit: limit, offset: 0, onlyLocal: false
            ) { response in
                logger.debug("GOT respone \(response)")
                if let messages = (try? response.get())?.messages {
                    promise(.success(messages))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
