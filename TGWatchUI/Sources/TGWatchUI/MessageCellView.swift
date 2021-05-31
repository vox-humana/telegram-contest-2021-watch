import MapKit
import SwiftUI

public struct MessageCellView: View {
    private let message: MessageState
    private let fullView: Bool

    public init(_ message: MessageState, fullView: Bool = false) {
        self.message = message
        self.fullView = fullView // TODO: use for limiting width in chat
    }

    public var body: some View {
//        Group {
        switch message.content {
        case let .text(text):
            if EmojiContentView.canRender(text) {
                EmojiContentView(text)
            } else {
                Text(text)
                    .padding(.tgTextPadding)
            }
        case let .location(content):
            LocationContentView(content)
                .disabled(true)
                .frame(maxWidth: fullView ? .infinity : .tgMessageWidth)
        case let .videoNote(content):
            VideoNoteContentView(content)
        case let .photo(content):
            PhotoContentView(
                state: content, width: fullView ? .screenWidth : .tgMessageWidth
            )
        case let .video(content):
            VideoContentView(
                state: content, width: fullView ? .screenWidth : .tgMessageWidth
            )
        case let .contact(content):
            ContactContentView(content, keepImageColors: !message.isOutgoing)
                .frame(maxWidth: fullView ? .infinity : .tgMessageWidth)
        case let .document(content):
            DocumentContentView(content, keepImageColors: !message.isOutgoing)
                .frame(maxWidth: fullView ? .infinity : .tgMessageWidth)
        case let .audio(content):
            AudioContentView(content, keepImageColors: !message.isOutgoing)
                .frame(maxWidth: fullView ? .infinity : .tgMessageWidth)
        case let .sticker(content):
            StickerContentView(content)
        }
//        }
    }
}

struct MessageCellView_Previews: PreviewProvider {
    static let messages: [MessageState] = .preview

    static var previews: some View {
        ScrollView {
            ForEach(0 ..< messages.count) { idx in
                let message = messages[idx]
                MessageCellView(message)
                    .tgMessageStyle(
                        isOutgoing: message.isOutgoing,
                        hideBackground: message.content.hiddenBackground,
                        ignoreClipping: message.content.hiddenBackground
                    )
            }
        }
        // .environment(\.imageLoader, DummyImageLoader(image: <#T##Image?#>))
        .accentColor(.blue)
    }
}
