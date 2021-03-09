import SwiftUI
import QrCode
import Combine

struct LoginView: View {
    @ObservedObject var vm: LoginViewModel
    @State var password: String = ""
        
    var body: some View {
        switch vm.state {
        case .codeRequested:
            ActivityIndicator()
        case .codeRecevied(let image):
            connectedView(qrCode: image)
        case .passwordWaiting:
            inputView
        }
    }
    
    func connectedView(qrCode: UIImage) -> some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Log in to Telegram\nby QR Code")
                    .font(.tgTitle)
                    .multilineTextAlignment(.center)
                Text("Settings on your Phone\nDevices\nScan QR")
                    .multilineTextAlignment(.center)
                Image(uiImage: qrCode).background(Color.white)
            }
        }
    }
    
    var inputView: some View {
        Form {
            Text("Enter password to complete login")
            SecureField("password", text: $password, onCommit:  {
                self.vm.service.sendAuthentication(password: Secrets.testPassword)
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            vm: LoginViewModel(
                service: .fake,
                initialState: .codeRecevied(QRCode.image(for: "tg://login?token=SomeRandomTelegramToken")!)
//                initialState: .codeRecevied(UIImage(named: "qr-code")!)
            )
        )
    }
}

final class LoginViewModel: ObservableObject {
    enum State: Equatable {
        case codeRequested
        case codeRecevied(UIImage)
        case passwordWaiting
    }
    
    @Published var state: State
    private var subscription: AnyCancellable?
    let service: TGService
    
    init(service: TGService, initialState: State = .codeRequested) {
        self.service = service
        state = initialState
        
        subscription = service.authStateSignal.receive(on: DispatchQueue.main).sink { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .initial:
                    self.state = .codeRequested
            case .confirmationWaiting(link: let link):
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
        // watchOS 7 doesn't have ProgressView
        Text("loading...")
    }
}

struct QRCode {
    static func image(for link: String) -> UIImage? {
        let screenSize = WKInterfaceDevice.current().screenBounds.width
        let (size, callback) = qrCode(string: link, color: .black, icon: .custom(UIImage(named: "Logo")))
        let imageSize = CGSize(width: screenSize, height: screenSize)
        return callback(.init(corners: .init(radius: 10), imageSize:imageSize , boundingSize: imageSize, intrinsicInsets: .zero))?.generateImage()
    }
}
