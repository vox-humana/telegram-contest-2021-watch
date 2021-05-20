import Combine
import Foundation

enum AuthState {
    case initial
    case confirmationWaiting(link: String)
    case passwordWaiting
    case passwordSent
    case authorized
}

protocol FileLoader {
    // var loadingStream: AnyPublisher<File>
    func downloadPhoto(for chat: Chat)
}

final class TGService {
    let authStateSignal = CurrentValueSubject<AuthState, Never>(.initial)
    let chatListSignal = CurrentValueSubject<[Chat], Never>([])

    private var chats: [ChatId: Chat] = [:]
    private var mainChatList: [(ChatId, Int64)] = []

    private let databasePath = FileManager.SearchPathDirectory.applicationDirectory
    private let client = TdClient()

    private var chatIcons: [FileId: ChatId] = [:]

    init() {}

    func start() {
        logger.debug("initializing TG client")

        client.run { [weak self] update in
            guard let self = self else { return }
            logger.debug("Received:\(update)")

            let updateType = update["@type"] as! String
            switch updateType {
            case "updateAuthorizationState":
                self.updateAuthorizationState(authorizationState: update["authorization_state"] as! [String: Any])

            case "updateNewChat":
                let chat = Chat(json: update["chat"]!)
                self.chats[chat.id] = chat
                self.setOrder(0, for: chat.id)
                self.notifyChats()

            // or separate storages?
            case "updateSecretChat",
                 "updateBasicGroup",
                 "updateSupergroup":
                logger.debug("Other chat type \(update)")
//                let chat = Chat(json: update["chat"]!)
//                self.chats[chat.id] = chat
//                self.notifyChats()

            case "updateUser":
                break

            case "updateChatLastMessage":
                guard let chatId = update["chat_id"] as? ChatId else {
                    assertionFailure("empty chat_id")
                    break
                }
                if let messageJSON = update["last_message"] as? JSON {
                    let message = Message(json: messageJSON)
                    self.chats[chatId]?.lastMessage = message
                }

                if let position = update["positions"] as? [JSON] {
                    // TODO: check
                    let lastPosition = position.last
                    assert(position.count <= 1)
                    if let order = lastPosition?.chatOrder() {
                        self.setOrder(order, for: chatId)
                    }
                }
                self.notifyChats()

            case "updateChatPosition":
                let chatId: ChatId = update.unwrap("chat_id")
                let position: JSON = update.unwrap("position")

                if self.chats[chatId] == nil {
                    logger.debug("ignore position update for \(chatId)")
                    break
                }
                // assert(self.chats[chatId] == nil) // TODO: check
                self.setOrder(position.chatOrder(), for: chatId)
                self.notifyChats()

            case "updateChatPhoto":
                break

            case "updateFile":
                let file = File(json: update.unwrap("file"))
                guard let chatId = self.chatIcons[file.id] else {
                    assertionFailure("Can't find chat for download \(file.id)")
                    break
                }
                self.chats[chatId]?.icon.smallFile = file
                self.notifyChats()

            case "updateConnectionState":
                self.updateConnectionSate(payload: update)

            default:
                logger.debug("Unknown update \(updateType)")
            }
        }

        client.queryAsync(query: ["@type": "getOption", "name": "version"])
    }

    func sendAuthentication(password: String) {
        logger.debug("Sending password....")
        client.queryAsync(query: ["@type": "checkAuthenticationPassword", "password": password], f: checkAuthenticationError)
    }

    private func requestMainChatList() {
        let limit = 20
        logger.debug("getChats....\(mainChatList)")

        let offsetChatId: ChatId
        let offsetOrder: Int64
        if !mainChatList.isEmpty {
            let last = mainChatList.last!
            offsetChatId = last.0
            offsetOrder = last.1
        } else {
            offsetChatId = 0
            offsetOrder = Int64.max
        }

        // https://core.telegram.org/tdlib/getting-started#getting-the-lists-of-chats
        client.queryAsync(query: ["@type": "getChats", "limit": limit, "offset_chat_id": offsetChatId, "offset_order": offsetOrder]) { [weak self] response in
            guard let self = self else { return }
            logger.debug(response)

            let chatIds: [ChatId] = response.unwrap("chat_ids")
            if chatIds.isEmpty {
                logger.debug("getChats done 1 \(self.mainChatList)")
                return
            }

            for chatId in chatIds {
                if self.chats[chatId] == nil {
                    self.requestMainChatList()
                }
            }

            // FIXME: check this
            // all chats were requested
            logger.debug("getChats done 2 \(self.mainChatList)")
        }
    }

    private func updateConnectionSate(payload: JSON) {
        let state: JSON = payload.unwrap("state")
        let type: String = state.unwrap("@type")
        logger.debug("Network state: \(type)")
    }

    private func setOrder(_ order: Int64, for chatId: ChatId) {
        guard let chat = chats[chatId] else {
            logger.debug("Haven't found chat for \(chatId)")
            return
        }
        if let index = mainChatList.firstIndex(where: { $0.0 == chatId && $0.1 == chat.position }) {
            mainChatList.remove(at: index)
        }
        chats[chatId]?.position = order
        mainChatList.append((chatId, order))
    }

    private func notifyChats() {
        // TODO: sorted by position
        let filteredChats = chats.values
            .filter { $0.lastMessage.id != -1 }
            .sorted(by: Chat.compare)
        logger.debug("Sending \(filteredChats.count) of \(chats.count)")
        chatListSignal.send(filteredChats)
    }

    private func updateAuthorizationState(authorizationState: JSON) {
        switch authorizationState["@type"] as! String {
        case "authorizationStateWaitTdlibParameters":
            client.queryAsync(query: [
                "@type": "setTdlibParameters",
                "parameters": [
                    "database_directory": URL.tdLibDirectory.path,
                    "files_directory": URL.filesDirectory.path,
                    "use_message_database": true,
                    "use_secret_chats": false,
                    "api_id": Secrets.appId,
                    "api_hash": Secrets.appHash,
                    "system_language_code": "en",
                    "device_model": "Watch",
                    // "system_version":
                    "application_version": "1.0",
                    "enable_storage_optimizer": true,
                ],
            ])

        case "authorizationStateWaitEncryptionKey":
            // assert(authorizationState["is_encrypted"] as? Int == 0, "encrypted storage is unsupported")
            client.queryAsync(query: ["@type": "checkDatabaseEncryptionKey", "encryption_key": ""])

        case "authorizationStateWaitPhoneNumber":
            logger.debug("Enter your phone number: ")
            client.queryAsync(query: ["@type": "requestQrCodeAuthentication"]) { response in
                logger.debug("GOT respone \(response)")
            }

        case "authorizationStateWaitCode":
            var code: String = ""
            logger.debug("Enter (SMS) code: ")
                // TODO:
//                code = myReadLine()
//                client.queryAsync(query:["@type":"checkAuthenticationCode", "code":code], f:checkAuthenticationError)

        case "authorizationStateWaitRegistration":
            logger.debug("Enter your first name: ")
            logger.debug("Enter your last name: ")

        case "authorizationStateWaitPassword":
            logger.debug("Enter password: ")
            authStateSignal.send(.passwordWaiting)

        case "authorizationStateReady":
            logger.debug("Authorized!")
            authStateSignal.send(.authorized)
            onLogin()

        case "authorizationStateLoggingOut":
            logger.debug("Logging out...")

        case "authorizationStateClosing":
            logger.debug("Closing...")

        case "authorizationStateClosed":
            logger.debug("Closed.")

        case "authorizationStateWaitOtherDeviceConfirmation":
            let link = authorizationState["link"] as! String
            logger.debug("received QR link \(link)")
            authStateSignal.send(.confirmationWaiting(link: link))

        default:
            assert(false, "TODO: Unexpected authorization state")
        }
    }

    private func checkAuthenticationError(error: [String: Any]) {
        if error["@type"] as! String == "error" {
            client.queryAsync(query: ["@type": "getAuthorizationState"], f: updateAuthorizationState)
        }
    }

    private func onLogin() {
        requestMainChatList()
    }
}

extension TGService: FileLoader {
    func downloadPhoto(for chat: Chat) {
        guard let file = chat.icon.smallFile, !file.downloaded else {
            return
        }

        logger.debug("Start download \(file.id)")
        chatIcons[file.id] = chat.id

        let chatAvatarsDownloadPriority = 1 // [1..32]
        client.queryAsync(query: ["@type": "downloadFile", "file_id": file.id, "priority": chatAvatarsDownloadPriority]) { [weak self] response in
            logger.debug(response)
        }
    }
}

private extension Chat {
    static func compare(chat1: Chat, chat2: Chat) -> Bool {
        chat1.position > chat2.position || chat1.id > chat2.id
    }
}

extension TGService {
    static let fake = TGService()
}

private extension URL {
    static let documentsURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask).first!
    static let tdLibDirectory = documentsURL.appendingPathComponent("tdlib")
    static let filesDirectory = documentsURL.appendingPathComponent("files")
}
