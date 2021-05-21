import Combine
import QrCode
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
        case let .codeRecevied(image):
            connectedView(qrCode: image)
        case .passwordWaiting:
            inputView
        }
    }

    func connectedView(qrCode: UIImage) -> some View {
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

                Image(uiImage: qrCode)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.top, 5)
            }
        }
    }

    var inputView: some View {
        Form {
            Text("Enter password to complete login")
            SecureField("password", text: $password, onCommit: {
                // TODO: real pass
                self.vm.sendPassword(Secrets.testPassword)
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            LoginViewModel(
                signal: Just(
                    AuthState.confirmationWaiting(link: "tg://login?token=SomeRandomTelegramToken")
                )
                .eraseToAnyPublisher()
            )
        )
    }
}

public final class LoginViewModel: ObservableObject {
    enum State: Equatable {
        case codeRequested
        case codeRecevied(UIImage)
        case passwordWaiting
    }

    @Published var state: State
    let sendPassword: (String) -> Void
    private var subscription: AnyCancellable?

    public init(signal: AnyPublisher<AuthState, Never>, sendPassword: @escaping (String) -> Void = { _ in }) {
        self.sendPassword = sendPassword
        state = .codeRequested

        subscription = signal.sink { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .initial:
                self.state = .codeRequested
            case let .confirmationWaiting(link: link):
                if let image = QRCode.image(for: link) {
                    self.state = .codeRecevied(image)
                }
            case .authorized:
                logger.debug("authorized")
            case .passwordWaiting:
                self.state = .passwordWaiting
            case .passwordSent:
                self.state = .codeRequested // TODO: loading
            }
        }
    }
}

struct ActivityIndicator: View {
    var body: some View {
        if #available(watchOS 7.0, *) {
            ProgressView()
        } else {
            Text("loading...")
        }
    }
}

enum QRCode {
    static func image(for link: String) -> UIImage? {
        let screenSize = WKInterfaceDevice.current().screenBounds.width
        let logo = UIImage(named: "Logo", in: Bundle(for: LoginViewModel.self), with: nil)
        let (size, callback) = qrCode(string: link, color: .black, icon: .custom(logo))
        let imageSize = CGSize(width: screenSize, height: screenSize)
        return callback(.init(corners: .init(radius: 10), imageSize: imageSize, boundingSize: imageSize, intrinsicInsets: .zero))?.generateImage()
    }
}
