import Combine
import SwiftUI

public struct ReplyPanelView: View {
    private let suggestions = [
        "Hello!", "What's up?", "On my way.", "OK",
    ]
    @Environment(\.messageService) var messageService
    @State private var text: String = ""

    // TODO: return messageId to scrollTo
    public init() {}

    public var body: some View {
        VStack {
            TextField("Reply", text: $text, onCommit: {
                messageService.send(text)
                text = ""
            })
            HStack {
                Button {
                    // TODO:
                }
                label: {
                    Image("VoiceMessage", bundle: .module)
                }
                Button {
                    // TODO: presentAudioRecordingControllerWithOutputURL on WKInterfaceController?
                }
                label: {
                    Image("Location", bundle: .module)
                }
                Button {
                    // TODO:
                }
                label: {
                    Image("Sticker", bundle: .module)
                }
            }
            .buttonStyle(PlainButtonStyle())
            Form {
                Section(header: Text("Suggestions")) {
                    ForEach(suggestions, id: \.self) { suggestion in
                        Button(suggestion) {
                            messageService.send(suggestion)
                        }
                    }
                    .font(.tgTitle)
                }
            }
        }
    }
}

struct ReplyPanelView_Previews: PreviewProvider {
    static var previews: some View {
        ReplyPanelView()
            .accentColor(.blue)
    }
}

public protocol MessageService {
    func send(_ message: String) -> AnyPublisher<Int64, Error>
}

public struct MessageServiceEnvironment: EnvironmentKey {
    public static var defaultValue: MessageService = DummyMessageService()
}

public extension EnvironmentValues {
    var messageService: MessageService {
        get { self[MessageServiceEnvironment.self] }
        set { self[MessageServiceEnvironment.self] = newValue }
    }
}

public struct DummyMessageService: MessageService {
    public func send(_: String) -> AnyPublisher<Int64, Error> {
        Just(Int64(0)).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}

// public final class ReplyPanelViewModel: ObservableObject {
//    public init() {
//
//    }
//
//    func send(_ message: String) {
//
//    }
// }
