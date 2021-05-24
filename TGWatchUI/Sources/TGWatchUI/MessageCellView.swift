import MapKit
import SwiftUI
import TGWatchModel

public struct MessageCellView: View {
    let message: Message

    public var body: some View {
        // TODO: media/borderless content
        Group {
            switch message.content {
            case let .text(text):
                Text(text)

            case .unsupported:
                Text(message.text)

            case let .location(location):
                LocationContentView(location: location)
                    .disabled(true)

            case let .videoNote(video):
                Text("video: \(video.duration)")

            case let .photo(photo):
                // TODO: download photo
                if let thumbnail = photo.minithumbnail {
                    Image(uiImage: thumbnail.image)
                } else {
                    Text("PHOTO")
                }
            }
        }
        .padding()
        .foregroundColor(message.contentColor)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .foregroundColor(message.backgroundColor)
        )
    }
}

private extension Message {
    var contentColor: Color {
        outgoing ? .white : .black
    }

    var backgroundColor: Color {
        outgoing ? .accentColor : .white
    }
}

struct MessageCellView_Previews: PreviewProvider {
    static let messages: [Message] = .fake()

    static var previews: some View {
        ScrollView {
            ForEach(0 ..< messages.count) { idx in
                MessageCellView(message: messages[idx])
            }
        }
        .accentColor(.blue)
    }
}
