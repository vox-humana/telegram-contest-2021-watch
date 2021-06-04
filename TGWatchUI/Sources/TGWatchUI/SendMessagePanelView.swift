import Combine
import MapKit
import SwiftUI

public struct SendMessagePanelView: View {
    private let suggestions = [
        "Hello!", "What's up?", "On my way.", "OK",
    ]
    @Environment(\.messageSender) private var messageSender
    @Environment(\.presentationMode) private var presentation
    @State private var text: String = ""
    @State private var locationPickerShown: Bool = false

    private let dismissOnSend: Bool

    public init(dismissOnSend: Bool = false) {
        self.dismissOnSend = dismissOnSend
    }

    public var body: some View {
        TextField("Reply", text: $text, onCommit: {
            self.sendTextMessage()
        })

        HStack {
            Button {
                WKExtension.shared().rootInterfaceController?.showRecording {
                    messageSender.sendVoiceFile($0)
                }
            }
            label: {
                Image("VoiceMessage", bundle: .module)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            Button {
                locationPickerShown = true
            }
            label: {
                Image("Location", bundle: .module)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            Button {
                // TODO:
            }
            label: {
                Image("Sticker", bundle: .module)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding(.top, 10)
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $locationPickerShown) {
            LocationPickerView {
                locationPickerShown = false
                messageSender.sendLocation($0)
                if dismissOnSend {
                    presentation.wrappedValue.dismiss()
                }
            }
        }
        .clearedListStyle()

        Section(
            header:
            Text("Suggestions".uppercased())
                .padding(
                    EdgeInsets(top: -10, leading: 0, bottom: 1, trailing: 0)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.tgSubtitle)
                .foregroundColor(.tgGrey)
        ) {
            ForEach(suggestions, id: \.self) { suggestion in
                Button {
                    self.sendTextMessage(suggestion)
                }
                label: {
                    Text(suggestion)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .font(.tgTitle)
            .frame(minHeight: 44)
        }
    }

    private func sendTextMessage(_ message: String? = nil) {
        messageSender.sendMessage(message ?? text)
        text = ""
        if dismissOnSend {
            presentation.wrappedValue.dismiss()
        }
    }
}

struct SendMessagePanelView_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreview {
            List {
                SendMessagePanelView()
            }
            .environment(\.defaultMinListRowHeight, 10)
        }
    }
}

private extension WKInterfaceController {
    func showRecording(completion: @escaping (URL) -> Void) {
        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("audio.mp4")
        presentAudioRecorderController(withOutputURL: url, preset: .narrowBandSpeech, options: nil) { flag, error in
            if flag {
                completion(url)
            } else {
                print(error?.localizedDescription ?? "failure")
            }
        }
    }
}

// TODO: use for emoji or scribble?
// WKExtension.shared().rootInterfaceController?
//    .presentTextInputController(
//        withSuggestions: nil, allowedInputMode: .allowEmoji
//    ) {
//        print($0)
//    }
