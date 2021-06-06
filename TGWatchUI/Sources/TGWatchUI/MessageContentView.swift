import SwiftUI

public struct MessageContentView: View {
    private let message: MessageState
    private let fullView: Bool

    public init(_ message: MessageState, fullView: Bool = false) {
        self.message = message
        self.fullView = fullView
    }

    public var body: some View {
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
            VideoNoteContentView(state: content, playable: fullView)
        case let .photo(content):
            PhotoContentView(
                state: content, width: fullView ? .screenWidth : .tgMessageWidth
            )
        case let .video(content):
            VideoContentView(
                state: content,
                width: fullView ? .screenWidth : .tgMessageWidth,
                playable: fullView
            )
        case let .contact(content):
            ContactContentView(content, keepImageColors: !message.isOutgoing)
                .frame(maxWidth: fullView ? .infinity : .tgMessageWidth)
        case let .document(content):
            DocumentContentView(content, keepImageColors: !message.isOutgoing)
                .frame(maxWidth: .infinity)
        case let .audio(content):
            AudioContentView(content, keepImageColors: !message.isOutgoing)
                .frame(maxWidth: fullView ? .infinity : .tgMessageWidth)
        case let .sticker(content):
            StickerContentView(state: content)
        case let .poll(content):
            if fullView {
                PollFullView(state: content)
            } else {
                PollContentView(state: content, outgoing: message.isOutgoing)
            }
        }
    }
}
