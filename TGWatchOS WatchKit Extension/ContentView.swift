import Combine
import SwiftUI
import TGWatchUI

struct ContentView: View {
    @State var showLoginFlow: Bool = true

    var body: some View {
        if showLoginFlow {
            LoginView(
                LoginViewModel(
                    service.authService
                )
            )
            .onReceive(service.authService.authStateSignal, perform: { state in
                DispatchQueue.main.async {
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
                }
            })
            .navigationBarTitle("Telegram")
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
