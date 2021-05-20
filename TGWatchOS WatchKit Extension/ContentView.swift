import SwiftUI

struct ContentView: View {
    @State var showLoginFlow: Bool = true

    var body: some View {
        if showLoginFlow {
            LoginView(vm: LoginViewModel(service: service))
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
        } else {
            ChatListView(vm: .init(fileLoader: service, listPublisher: service.chatListSignal.eraseToAnyPublisher()))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let service: TGService = {
    let s = TGService()
    s.start()
    return s
}()
