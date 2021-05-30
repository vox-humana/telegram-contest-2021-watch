import Combine
import SwiftUI

public struct LoginView: View {
    @ObservedObject var vm: LoginViewModel
    @State var password: String = ""

    public init(_ vm: LoginViewModel) {
        self.vm = vm
    }

    public var body: some View {
        switch vm.state {
        case .codeRequested:
            ActivityIndicator()
        case let .codeReceived(link):
            connectedView(link: link)
        case .passwordWaiting:
            inputView
        }
    }

    func connectedView(link: String) -> some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .center, spacing: 3) {
                    Text("Log in to Telegram\nby QR Code")
                        .font(.tgLoginTitle)
                        .multilineTextAlignment(.center)

                    Text("Settings on your Phone")
                        .font(.tgSubtitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.tgGrey)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.tgGrey)

                    Text("Devices")
                        .font(.tgSubtitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.tgGrey)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.tgGrey)

                    Text("Scan QR")
                        .font(.tgSubtitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.tgGrey)
                        .padding(.bottom, 8)

                    QRCodeView(
                        link,
                        image: UIImage(named: "qr-logo", in: .module, with: nil)
                    )
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(width: proxy.size.maxSide, height: proxy.size.maxSide)
                }
            }
        }
    }

    var inputView: some View {
        Form {
            Text("Enter password to complete login")
            SecureField("password", text: $password, onCommit: {
                self.vm.sendPassword(password)
            })
        }
    }

    private var qrCodeSize: CGFloat {
        WKInterfaceDevice.current().screenBounds.width
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            LoginViewModel(
                DummyAuthService(state: .confirmationWaiting(link: "https://telegram.org"))
            )
        )
    }
}

public final class LoginViewModel: ObservableObject {
    enum State: Equatable {
        case codeRequested
        case codeReceived(String)
        case passwordWaiting
    }

    @Published var state: State

    private var subscription: AnyCancellable?
    private let service: AuthService

    public init(_ service: AuthService) {
        self.service = service
        state = .codeRequested

        subscription = service.authStateSignal.sink { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .initial:
                self.state = .codeRequested
            case let .confirmationWaiting(link: link):
                self.state = .codeReceived(link)
            case .authorized:
                print("authorized")
            case .passwordWaiting:
                self.state = .passwordWaiting
            case .passwordSent:
                self.state = .codeRequested // TODO: loading
            }
        }
    }

    public func sendPassword(_ password: String) {
        service.sendAuthentication(password: password)
    }
}
