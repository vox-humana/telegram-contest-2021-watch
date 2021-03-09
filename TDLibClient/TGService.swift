import Foundation
import Combine

protocol NetworkClient {
    func requestQRCode()
    func requestChatList()
}

extension URL {
    private static let documentsURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask).first!
    static let tdLibDirectory = documentsURL.appendingPathComponent("tdlib")
    static let filesDirectory = documentsURL.appendingPathComponent("files")
}

enum AuthState {
    case initial
    case confirmationWaiting(link: String)
    case passwordWaiting
    case passwordSent
    case authorized
}

final class TGService {
    let authStateSignal = CurrentValueSubject<AuthState, Never>(.initial)
    let chatListSignal = CurrentValueSubject<[Chat], Never>([])

    private var chats: [ChatId: Chat] = [:]
    private var mainChatList: [(ChatId, Int64)] = []
    
    private let databasePath = FileManager.SearchPathDirectory.applicationDirectory
    private let client = TdClient()
    
    init() {
    }
    
    func start() {
        logger.debug("initializing TG client")
        client.queryAsync(query: ["@type":"getOption", "name":"version"])
        
        client.run { [weak self] update in
            guard let self = self else { return }
            logger.debug("Received:\(update)")

            let updateType = update["@type"] as! String
            switch updateType {
            case "updateAuthorizationState":
                self.updateAuthorizationState(authorizationState: update["authorization_state"] as! Dictionary<String, Any>)
            case "updateNewChat":
                let chat = Chat(json: update["chat"]!)
                self.chats[chat.id] = chat
                self.notifyChats()
                
                break
            case "updateUser":
                break
                
            case "updateChatLastMessage":
                let message = Message(json: update["last_message"]!)
                if let chatId = update["chat_id"] as? ChatId {
                    self.chats[chatId]?.lastMessage = message
                    self.notifyChats()
                }
            case "updateChatPosition":
                let chatId: ChatId = update.unwrap("chat_id")
                let position: JSON = update.unwrap("position")
                let orderString: String = position.unwrap("order") // :Why:
                let order = Int64(orderString)!
                if self.chats[chatId] == nil {
                    logger.debug("ignore position update for \(chatId)")
                    break
                }
                //assert(self.chats[chatId] == nil) // TODO: check
                self.chats[chatId]?.position = order
                self.notifyChats()
                break
                
            case "updateChatPhoto":
                break
                
            default:
                break
            }
        }
    }
    
    func sendAuthentication(password: String) {
        logger.debug("Sending password....")
        client.queryAsync(query:["@type":"checkAuthenticationPassword", "password":password], f:checkAuthenticationError)
    }
    
    func requestChats() {
        logger.debug("Requesting chats....\(mainChatList.count)")
        
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
        let limit = 20
        // https://core.telegram.org/tdlib/getting-started#getting-the-lists-of-chats
        client.queryAsync(query: ["@type":"getChats", "limit": limit, "offset_chat_id": offsetChatId, "offset_order": offsetOrder]) { [weak self] response in
            guard let self = self else { return }
            logger.debug(response)

            let chatIds: [ChatId] = response.unwrap("chat_ids")
            if chatIds.isEmpty {
                logger.debug("getChats done \(self.mainChatList.count)")
                return
            }
            
            // TODO: pagination
            // self.requestChats()
        }
    }
    
    private func notifyChats() {
        // TODO: sorted by position
        let filteredChats = chats.values
            .filter({ $0.lastMessage.id != -1 })
            .sorted(by: Chat.compare)
        logger.debug("Sending \(filteredChats.count) of \(chats.count)")
        chatListSignal.send(filteredChats)
    }
    
    private func updateAuthorizationState(authorizationState: Dictionary<String, Any>) {
        switch(authorizationState["@type"] as! String) {
            case "authorizationStateWaitTdlibParameters":
                client.queryAsync(query:[
                    "@type":"setTdlibParameters",
                    "parameters":[
                        "database_directory": URL.tdLibDirectory.path,
                        "files_directory": URL.filesDirectory.path,
                        "use_message_database":true,
                        "use_secret_chats":true,
                        "api_id":Secrets.appId,
                        "api_hash":Secrets.appHash,
                        "system_language_code":"en",
                        "device_model":"Watch",
                        "application_version":"1.0",
                        "enable_storage_optimizer":true
                    ]
                ]);

            case "authorizationStateWaitEncryptionKey":
                //assert(authorizationState["is_encrypted"] as? Int == 0, "encrypted storage is unsupported")
                client.queryAsync(query: ["@type":"checkDatabaseEncryptionKey", "encryption_key":""])

            case "authorizationStateWaitPhoneNumber":
                logger.debug("Enter your phone number: ")
                client.queryAsync(query: ["@type":"requestQrCodeAuthentication"]) { response in
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
                assert(false, "TODO: Unexpected authorization state");
        }
    }

    private func checkAuthenticationError(error: Dictionary<String, Any>) {
        if (error["@type"] as! String == "error") {
            client.queryAsync(query:["@type":"getAuthorizationState"], f:updateAuthorizationState)
        }
    }
    
    private func onLogin() {
        requestChats()
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
