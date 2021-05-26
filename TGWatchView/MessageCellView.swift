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
            case let .messageLocation(location):
                LocationContentView(location: location.location)
                    .disabled(true)
            case let .messageVideoNote(note):
                Text("Video: \(note.videoNote.duration)")
            case let .messagePhoto(photo):
                PhotoContentView(photo: photo.photo)
            default:
                Text(message.lastMessageText)
            }
        }
        .padding()
        .foregroundColor(message.contentColor)
        .background(
            RoundedRectangle(cornerRadius: .tgMessageCornerRadius, style: .circular)
                .foregroundColor(message.backgroundColor)
        )
    }
}

private extension Message {
    var contentColor: Color {
        isOutgoing ? .white : .black
    }

    var backgroundColor: Color {
        isOutgoing ? .accentColor : .white
    }
}

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
