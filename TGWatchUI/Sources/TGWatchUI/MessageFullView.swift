import SwiftUI

// TODO: pass canSendMessages
public struct MessageFullView: View {
    private let state: MessageState

    public init(_ state: MessageState) {
        self.state = state
    }

    public var body: some View {
        List {
            HStack(spacing: 8) {
                AvatarView(state.sender.photo)
                Text(state.sender.senderName)
                    .font(.tgTitle)
                    .lineLimit(1)
            }
            .frame(minHeight: 44)

            MessageCellView(state, fullView: true)
                .tgMessageStyle(
                    isOutgoing: state.isOutgoing, hideBackground: true, ignoreClipping: state.content.hiddenBackground
                )
                .clearedListStyle()

            HStack {
                Text(DateFormatter.date(from: state.date).uppercased())
                Spacer()
                Text(DateFormatter.time(from: state.date))
            }
            .font(.tgSubtitle)
            .foregroundColor(.tgGrey)
            .listRowBackground(Color.clear)

            SendMessagePanelView(chatId: state.chatId)
        }
        .environment(\.defaultMinListRowHeight, 10)
        .navigationBarTitle(Text("Message"))
    }
}

extension MessageSenderState {
    var senderName: String {
        switch self {
        case let .user(user):
            return user.fullName
        case let .chat(chat):
            return chat.title
        }
    }

    var photo: ThumbnailState? {
        switch self {
        case let .user(user):
            return user.photo
        case let .chat(chat):
            return chat.photo
        }
    }
}

struct MessageFullView_Previews: PreviewProvider {
    static let messages: [MessageState] = .preview

    static var previews: some View {
        ForEach(0 ..< messages.count) { i in
            MessageFullView(messages[i])
        }
    }
}
