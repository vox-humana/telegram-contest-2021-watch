import Combine
import SwiftUI

struct ContentView: View {
    @State var showLoginFlow: Bool = true

    var body: some View {
        if showLoginFlow {
            let login = LoginView(
                LoginViewModel(
                    signal: service.authService.authStateSignal.eraseToAnyPublisher(),
                    sendPassword: service.authService.sendAuthentication(password:)
                )
            )
            .onReceive(service.authService.authStateSignal, perform: { state in
                switch state {
                case .initial:
                    showLoginFlow = true
                case .confirmationWaiting:
                    showLoginFlow = true
                case .authorized:
                    showLoginFlow = false
                case .passwordWaiting:
                    showLoginFlow = true
                case .passwordSent:
                    showLoginFlow = true
                }
            })

            if #available(watchOS 7.0, *) {
                login
                    .navigationBarTitle("Telegram")
            } else {
                login
            }
        } else {
            let chatList = ChatListView(
                .init(
                    chatListService: service.mainChatListService
                )
            )

            if #available(watchOS 7.0, *) {
                TabView {
                    chatList
                    SettingsView(
                        SettingsViewModel(
                            profile: service.authService.requestMe()
                        ),
                        archiveListService: service.archiveChatListService
                    )
                }
            } else {
                chatList
            }
        }
    }
}

let service: TGService = {
    let s = TGService()
    s.start()
    return s
}()
