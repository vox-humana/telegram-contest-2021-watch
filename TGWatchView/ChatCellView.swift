import SwiftUI
import TGWatchUI

struct ChatCellView: View {
    let chat: Chat
    let downloadPhoto: (Chat) -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            AvatarView(chat.photo.map(ThumbnailState.init(chatPhoto:)))
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                .onAppear {
                    downloadPhoto(chat)
                }

            VStack(alignment: .leading) {
                Text(chat.title)
                    .lineLimit(1)
                    .font(.tgChatTitle)
                    .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 0))
                Text(chat.lastMessage?.lastMessageText ?? "")
                    .lineLimit(1)
                    .font(.body)

                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    Text(
                        chat.lastMessage
                            .map(\.foundationDate)
                            .flatMap(DateFormatter.time(from:))
                            ?? ""
                    )
                    .font(.caption)
                    .foregroundColor(.tgGrey)

                    // TODO: or onplayed?
                    if chat.unreadMentionCount > 0 {
                        UnreadIndicator().foregroundColor(.accentColor)
                    }

                    Spacer()

                    if chat.unreadCount > 0 {
                        UnreadBadge(chat.unreadCount)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 4))
            }
        }
    }
}

extension Message {
    var foundationDate: Date {
        Date(timeIntervalSince1970: TimeInterval(date))
    }

    var lastMessageText: String {
        switch content {
        case let .messageText(text):
            return text.text.text
        case .messageAnimation:
            return "GIF"
        case .messageAudio:
            return "Audio"
        case .messageDocument:
            return "Document"
        case .messagePhoto:
            return "Photo"
        case .messageExpiredPhoto:
            return "Expired photo"
        case let .messageSticker(sticker):
            return sticker.sticker.emoji + "Sticker"
        case .messageVideo:
            return "Video"
        case .messageExpiredVideo:
            return "Expired video"
        case .messageVideoNote:
            return "Video message"
        case .messageVoiceNote:
            return "Voice message"
        case .messageLocation:
            return "Location"
        case .messageVenue:
            return "Venue"
        case .messageContact:
            return "Contact"
        case .messageDice:
            return "Dice"
        case .messageGame:
            return "Game"
        case .messagePoll:
            return "Poll"
        case .messageInvoice:
            return "Invoice"
        case .messageCall:
            return "Call"

        case .messageVoiceChatScheduled:
            return "Voice chat scheduled"
        case .messageVoiceChatStarted:
            return "Voice chat started"
        case .messageVoiceChatEnded:
            return "Voice chat ended"
        case .messageBasicGroupChatCreate:
            return "Chat created"
        case .messageSupergroupChatCreate:
            return "Chat created"
        case
            .messageInviteVoiceChatParticipants(_),
            .messageChatChangeTitle(_),
            .messageChatChangePhoto(_),
            .messageChatDeletePhoto,
            .messageChatAddMembers(_),
            .messageChatJoinByLink,
            .messageChatDeleteMember(_),
            .messageChatUpgradeTo(_),
            .messageChatUpgradeFrom(_),
            .messagePinMessage(_),
            .messageScreenshotTaken,
            .messageChatSetTtl(_),
            .messageCustomServiceAction(_),
            .messageGameScore(_),
            .messagePaymentSuccessful(_),
            .messagePaymentSuccessfulBot(_),
            .messageContactRegistered,
            .messageWebsiteConnected(_),
            .messagePassportDataSent(_),
            .messagePassportDataReceived(_),
            .messageProximityAlertTriggered(_),
            .messageUnsupported:
            return ""
        }
    }
}

#if DEBUG
    import Combine

    struct ChatListView_Previews: PreviewProvider {
        static var previews: some View {
            ChatListView(
                ChatListViewModel(
                    chatListService: DummyService()
                )
            )
        }
    }
#endif
