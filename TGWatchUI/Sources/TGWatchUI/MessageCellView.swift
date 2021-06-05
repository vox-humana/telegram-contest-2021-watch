import MapKit
import SwiftUI

public struct MessageCellView: View {
    private let message: MessageState

    public init(_ message: MessageState) {
        self.message = message
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            senderView

            replyView

            MessageContentView(message, fullView: false)
        }
    }

    @ViewBuilder
    private var senderView: some View {
        if showSender {
            Text(message.sender.senderName)
                .lineLimit(1)
                .font(.tgSender)
                .foregroundColor(message.sender.color)
                .padding(EdgeInsets(top: 4, leading: 9, bottom: needsSenderBottomPadding ? 4 : 0, trailing: 9))
        }
    }

    @ViewBuilder
    private var replyView: some View {
        if let reply = message.reply {
            ReplyView(state: reply, accentColor: !message.isOutgoing, showSender: showSender)
        }
    }

    private var replyColor: Color {
        !message.isOutgoing ? Color.accentColor : Color.white
    }

    private var showSender: Bool {
        !message.isOutgoing && !message.privateChat
    }

    private var needsSenderBottomPadding: Bool {
        guard message.reply == nil else {
            return true
        }

        switch message.content {
        case let .text(text):
            return EmojiContentView.canRender(text)
        case .photo:
            return true
        case .video:
            return true
        case .videoNote:
            return true
        case .sticker:
            return true
        case .poll:
            return true
        case .audio:
            return false
        case .contact:
            return false
        case .document:
            return false
        case .location:
            return true
        }
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
        .environment(\.imageLoader, DummyImageLoader(image: Image("Image.png")))
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
