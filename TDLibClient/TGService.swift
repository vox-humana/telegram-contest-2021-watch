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

    private let databasePath = FileManager.SearchPathDirectory.applicationDirectory
    private let client = TdClient()
    
    init() {
    }
    
    func start() {
        print("initializing TG client")
        client.queryAsync(query: ["@type":"getOption", "name":"version"])
        
        client.run { [weak self] update in
            print(update)
            if update["@type"] as! String == "updateAuthorizationState" {
                self?.updateAuthorizationState(authorizationState: update["authorization_state"] as! Dictionary<String, Any>)
            }
        }
    }
    
    func sendAuthentication(password: String) {
        print("Sending password....")
        client.queryAsync(query:["@type":"checkAuthenticationPassword", "password":password], f:checkAuthenticationError)
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
                print("Enter your phone number: ")
                client.queryAsync(query: ["@type":"requestQrCodeAuthentication"]) { response in
                    print("GOT respone", response)
                }

            case "authorizationStateWaitCode":
                var code: String = ""
                print("Enter (SMS) code: ")
                // TODO:
//                code = myReadLine()
//                client.queryAsync(query:["@type":"checkAuthenticationCode", "code":code], f:checkAuthenticationError)

            case "authorizationStateWaitRegistration":
                print("Enter your first name: ")
                print("Enter your last name: ")

            case "authorizationStateWaitPassword":
                print("Enter password: ")
                authStateSignal.send(.passwordWaiting)

            case "authorizationStateReady":
                print("Authorized!")
                authStateSignal.send(.authorized)

            case "authorizationStateLoggingOut":
                print("Logging out...")

            case "authorizationStateClosing":
                print("Closing...")

            case "authorizationStateClosed":
                print("Closed.")

            case "authorizationStateWaitOtherDeviceConfirmation":
                let link = authorizationState["link"] as! String
                print("received QR link", link)
                authStateSignal.send(.confirmationWaiting(link: link))
                
                
            default:
                assert(false, "TODO: Unexpected authorization state");
        }
    }

    func checkAuthenticationError(error: Dictionary<String, Any>) {
        if (error["@type"] as! String == "error") {
            client.queryAsync(query:["@type":"getAuthorizationState"], f:updateAuthorizationState)
        }
    }
}


extension TGService {
    static let fake = TGService()
}
