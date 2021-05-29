import Combine
import SwiftUI

public struct ReplyPanelView: View {
    private let suggestions = [
        "Hello!", "What's up?", "On my way.", "OK",
    ]
    @Environment(\.chatService) var chatService
    @State private var text: String = ""

    private let chatId: ChatId

    public init(chatId: ChatId) {
        self.chatId = chatId
    }

    public var body: some View {
        TextField("Reply", text: $text, onCommit: {
            self.sendTextMessage()
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
        .clearedListStyle()
        .buttonStyle(PlainButtonStyle())

        Section(
            header: Text("Suggestions".uppercased())
                .padding(
                    EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.tgSubtitle)
                .foregroundColor(.tgGrey)
        ) {
            ForEach(suggestions, id: \.self) { suggestion in
                Button {
                    self.sendTextMessage()
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

    private func sendTextMessage() {
        // TODO: move outside
        chatService.send(text, to: chatId)
        text = ""
    }
}

struct ReplyPanelView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ReplyPanelView(chatId: 0)
        }
        .accentColor(.blue)
    }
}
