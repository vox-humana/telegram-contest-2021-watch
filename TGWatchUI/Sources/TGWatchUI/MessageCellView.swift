import MapKit
import SwiftUI

public struct MessageCellView: View {
    private let message: MessageState
    private let fullView: Bool

    public init(_ message: MessageState, fullView: Bool = false) {
        self.message = message
        self.fullView = fullView
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            senderView

            replyView

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
                StickerContentView(state: content)
            }
        }
    }

    @ViewBuilder
    private var senderView: some View {
        if !message.isOutgoing, !message.privateChat {
            Text(message.sender.senderName)
                .lineLimit(1)
                .font(.tgSender)
                .foregroundColor(message.sender.color)
                .padding(EdgeInsets(top: 4, leading: 9, bottom: -3, trailing: 9))
        }
    }

    @ViewBuilder
    private var replyView: some View {
        if let reply = message.reply {
            HStack(spacing: 6) {
                Rectangle()
                    .fill(replyColor)
                    .cornerRadius(2)
                    .frame(width: 2, height: 30)
                VStack(alignment: .leading) {
                    Text(reply.sender.senderName)
                        .lineLimit(1)
                        .foregroundColor(replyColor)
                    Text(reply.content)
                        .lineLimit(1)
                        .font(.tgSubtitle)
                }
            }
            .padding(EdgeInsets(top: 7, leading: 11, bottom: -3, trailing: 0))
        }
    }

    private var replyColor: Color {
        fullView || !message.isOutgoing ? Color.accentColor : Color.white
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

extension MessageSenderState {
    var color: Color {
        switch self {
        case let .user(user):
            return getUserColor(user.id)
        case let .chat(chat):
            return getUserColor(UserId(chat.id)) // TODO: check
        }
    }
}
