import MapKit
import SwiftUI
import TGWatchUI

public struct MessageCellView: View {
    let message: Message

    public var body: some View {
        Group {
            switch message.content {
            case let .messageText(text):
                Text(text.text.text)
                    .padding(.tgTextPadding)
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
        .tgMessageStyle(isOutgoing: message.isOutgoing)
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
