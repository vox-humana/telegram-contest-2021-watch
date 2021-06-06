import Combine
import Foundation

final class TGService {
    private let client = TDCLient()
    let api: TdApi

    let authService: TGAuthService
    let mainChatListService: TGChatListService
    let archiveChatListService: TGChatListService
    let chatService: TGChatService
    let notificationService: TGNotificationService

    init() {
        api = TdApi(client: client)
        authService = TGAuthService(api: api)
        mainChatListService = TGChatListService(api: api, list: .chatListMain)
        archiveChatListService = TGChatListService(api: api, list: .chatListArchive)
        chatService = TGChatService(api: api)
        notificationService = TGNotificationService(api: api)
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
//                self.mainChatListService.requestChatList()
//                self.archiveChatListService.requestChatList()
            }
        default:
            break
        }

        mainChatListService.process(update: update)
        archiveChatListService.process(update: update)
        authService.process(update: update)
        chatService.process(update: update)
        notificationService.process(update: update)
    }
}
