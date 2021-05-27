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
            case let .messageLocation(location):
                LocationContentView(state: .init(location))
                    .disabled(true)
            case let .messageVideoNote(note):
                Text("Video: \(note.videoNote.duration)")
            case let .messagePhoto(photo):
                MessagePhotoContentView(photo: photo)
            case let .messageVideo(video):
                MessageVideoContentView(video: video)
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
