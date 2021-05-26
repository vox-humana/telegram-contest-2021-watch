import MapKit
import SwiftUI

public struct MessageCellView: View {
    let message: Message

    public var body: some View {
        // TODO: media/borderless content
        Group {
            switch message.content {
            case let .messageText(text):
                Text(text.text.text)
                    .padding(.tgTextPadding)
            case let .messageLocation(location):
                LocationContentView(location: location.location)
                    .disabled(true)
            case let .messageVideoNote(note):
                Text("Video: \(note.videoNote.duration)")
            case let .messagePhoto(photo):
                MessagePhotoContentView(photo: photo)
            case let .messageVideo(video):
                MessageVieoContentView(video: video)
            default:
                Text(message.lastMessageText)
                    .padding(.tgTextPadding)
            }
        }
        .foregroundColor(message.contentColor)
        .background(message.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: .tgMessageCornerRadius, style: .circular))
    }
}

extension EdgeInsets {
    static let tgTextPadding = EdgeInsets(top: 3, leading: 9, bottom: 5, trailing: 9)
}

private extension Message {
    var contentColor: Color {
        isOutgoing ? .white : .black
    }

    var backgroundColor: Color {
        isOutgoing ? .accentColor : .white
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
