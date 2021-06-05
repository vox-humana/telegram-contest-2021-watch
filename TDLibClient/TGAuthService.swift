import Combine
import Foundation
import TGWatchUI // TODO: extract model
import UserNotifications
import WatchKit

final class TGAuthService {
    private let authStateSubject = CurrentValueSubject<AuthState, Never>(.initial)
    private let api: TdApi

    init(api: TdApi) {
        self.api = api
    }

    func process(update: Update) {
        switch update {
        case let .updateAuthorizationState(state):
            process(authorizationState: state.authorizationState)
        default:
            break
        }
    }

    func requestMe() -> AnyPublisher<User, Never> {
        Future<User, Never> { [api] promise in
            try? api.getMe { response in
                logger.debug("GOT respone \(response)")
                if let user = try? response.get() {
                    promise(.success(user))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    private func process(authorizationState: AuthorizationState) {
        switch authorizationState {
        case .authorizationStateWaitTdlibParameters:
            try? api.setTdlibParameters(parameters: .app) {
                Self.logError($0)
            }
        case .authorizationStateWaitEncryptionKey:
            let key = "".data(using: .utf8)!
            try? api.checkDatabaseEncryptionKey(encryptionKey: key) {
                Self.logError($0)
            }
        case .authorizationStateWaitPhoneNumber:
            logger.debug("Enter your phone number: ")
            try? api.requestQrCodeAuthentication(otherUserIds: []) {
                Self.logError($0)
            }
        case let .authorizationStateWaitOtherDeviceConfirmation(confirmation):
            let link = confirmation.link
            logger.debug("received QR link \(link)")
            sendAuthState(.confirmationWaiting(link: link))

        case .authorizationStateWaitCode:
            logger.debug("Enter (SMS) code: ")
            logger.assert("unsupported\(authorizationState)")

        case .authorizationStateWaitRegistration:
            logger.debug("Enter your first name: ")
            logger.debug("Enter your last name: ")
            logger.assert("unsupported\(authorizationState)")

        case .authorizationStateWaitPassword:
            logger.debug("Enter password: ")
            sendAuthState(.passwordWaiting)

        case .authorizationStateReady:
            logger.debug("Authorized!")
            sendAuthState(.authorized)
            requestPushToken()

        case .authorizationStateLoggingOut:
            logger.debug("Logging out...")
            // TODO:

        case .authorizationStateClosing:
            logger.debug("Closing...")

        case .authorizationStateClosed:
            logger.debug("Closed.")
        }
    }

    private static func logError(_ response: Result<Ok, Swift.Error>) {
        if case let .failure(error) = response {
            logger.assert(error.localizedDescription)
        }
    }

    private func sendAuthState(_ state: AuthState) {
        DispatchQueue.main.async {
            self.authStateSubject.send(state)
        }
    }

    private func requestPushToken() {
        DispatchQueue.main.async {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, error in
                if let error = error {
                    logger.assert(error.localizedDescription)
                } else {
                    WKExtension.shared().registerForRemoteNotifications()
                }
            }
        }
    }

    func registerForPush(token: Data) {
        let hexString = token.map { data in String(format: "%02.2hhx", data) }.joined()
        logger.debug("Device token raw: \(hexString)")
        // https://core.telegram.org/tdlib/notification-api/
        try? api.registerDevice(deviceToken: .deviceTokenApplePush(.init(deviceToken: hexString, isAppSandbox: true)), otherUserIds: []) { result in
            logger.debug("Device registration result: \(result)")
        }
    }
}

extension TGAuthService: AuthService {
    var authStateSignal: AnyPublisher<AuthState, Never> {
        authStateSubject.eraseToAnyPublisher()
    }

    func sendAuthentication(password: String) {
        logger.debug("Sending password....")
        try? api.checkAuthenticationPassword(password: password) { [weak self] response in
            if case let .failure(error) = response {
                logger.debug(error.localizedDescription)
                try? self?.api.getAuthorizationState { [weak self] in
                    if let state = try? $0.get() {
                        self?.process(authorizationState: state)
                    }
                }
            }
        }
    }
}

private extension TdlibParameters {
    // TODO: add secrets here?
    static let app = TdlibParameters(
        apiHash: Secrets.appHash,
        apiId: Secrets.appId,
        applicationVersion: "1.0",
        databaseDirectory: URL.tdLibDirectory.path,
        deviceModel: "Watch",
        enableStorageOptimizer: true,
        filesDirectory: URL.filesDirectory.path,
        ignoreFileNames: false,
        systemLanguageCode: Locale.current.languageCode ?? "en",
        // If empty, the version is automatically detected by TDLib
        systemVersion: "",
        useChatInfoDatabase: true,
        useFileDatabase: true,
        useMessageDatabase: true,
        useSecretChats: false,
        useTestDc: false
    )
}

private extension URL {
    static let documentsURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask).first!
    static let tdLibDirectory = documentsURL.appendingPathComponent("tdlib")
    static let filesDirectory = documentsURL.appendingPathComponent("files")
}
