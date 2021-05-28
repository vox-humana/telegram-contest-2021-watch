import MapKit
import SwiftUI
import TGWatchUI

public struct MessageCellView: View {
    let message: Message

    public var body: some View {
        Group {
            switch message.content {
            case let .messageText(text):
                if EmojiContentView.canRender(text.text.text) {
                    EmojiContentView(text.text.text)
                } else {
                    Text(text.text.text)
                        .padding(.tgTextPadding)
                }
            case let .messageLocation(content):
                LocationContentView(.init(content))
                    .disabled(true)
            case let .messageVideoNote(content):
                VideoNoteContentView(.init(content))
            case let .messagePhoto(content):
                PhotoContentView(.init(content))
            case let .messageVideo(content):
                VideoContentView(.init(content))
            case let .messageContact(content):
                ContactContentView(.init(content), keepImageColors: !message.isOutgoing)
            case let .messageDocument(content):
                DocumentContentView(.init(content), keepImageColors: !message.isOutgoing)
            case let .messageAudio(content):
                AudioContentView(.init(content), keepImageColors: !message.isOutgoing)
            default:
                Text(message.lastMessageText)
                    .padding(.tgTextPadding)
            }
        }
        .tgMessageStyle(isOutgoing: message.isOutgoing, hideBackground: message.content.hiddenBackground)
    }
}

private extension MessageContent {
    var hiddenBackground: Bool {
        switch self {
        case let .messageText(text) where EmojiContentView.canRender(text.text.text):
            return true
        case .messageVideoNote:
            return true
        default:
            return false
        }
    }
}

#if DEBUG
    struct MessageCellView_Previews: PreviewProvider {
        static let messages: [Message] = .preview()

        static var previews: some View {
            ScrollView {
                ForEach(0 ..< messages.count) { idx in
                    MessageCellView(message: messages[idx])
                }
            }
            .accentColor(.blue)
        }
    }
#endif
