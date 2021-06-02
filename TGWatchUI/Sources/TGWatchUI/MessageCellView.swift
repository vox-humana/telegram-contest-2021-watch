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

            MessageContentView(message, fullView: fullView)
        }
    }

    @ViewBuilder
    private var senderView: some View {
        // TODO: bottom offset for images
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
