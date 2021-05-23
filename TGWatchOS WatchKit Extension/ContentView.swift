import SwiftUI
import TGSwiftUI

struct ContentView: View {
    @State var showLoginFlow: Bool = true

    var body: some View {
        if showLoginFlow {
            let login = LoginView(
                LoginViewModel(
                    signal: service.authStateSignal.eraseToAnyPublisher(),
                    sendPassword: service.sendAuthentication(password:)
                )
            )
            .onReceive(service.authStateSignal, perform: { state in
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
                    fileLoader: service,
                    listPublisher: service.chatListSignal.eraseToAnyPublisher()
                )
            )
            .environment(\.historyService, service)

            if #available(watchOS 7.0, *) {
                TabView {
                    chatList
                    SettingsView(
                        SettingsViewModel(
                            profile: service.requestMe()
                        )
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
