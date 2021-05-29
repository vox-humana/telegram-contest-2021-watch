import MapKit
import TGWatchUI

extension AudioState {
    convenience init(_ message: MessageAudio) {
        self.init(
            caption: message.caption.text,
            duration: message.audio.duration,
            unplayed: false // TODO: ?
        )
    }
}

extension LocationState {
    init(_ message: MessageLocation) {
        self.init(
            location: CLLocationCoordinate2D(
                latitude: message.location.latitude,
                longitude: message.location.longitude
            ),
            isLive: message.livePeriod > 0
        )
    }
}

extension VideoState {
    convenience init(_ message: MessageVideo) {
        self.init(
            caption: message.caption.text,
            duration: message.video.duration,
            thumbnail: LocalPhotoState(
                file: LocalFileState(video: message.video),
                minithumbnail: MiniThumbnailState(message.video.minithumbnail)
            )
        )
    }
}

extension PhotoState {
    init(_ message: MessagePhoto) {
        self.init(
            photo: LocalPhotoState(
                file: .init(photo: message.photo),
                minithumbnail: MiniThumbnailState(message.photo.minithumbnail)
            ),
            caption: message.caption.text
        )
    }
}

extension LocalFileState {
    init(video: Video) {
        self.init(
            file: video.video
        )
    }
}

extension LocalFileState {
    init(photo: Photo) {
        self.init(
            file: photo.small
        )
    }
}

extension LocalPhotoState {
    init(chatPhoto: ChatPhotoInfo) {
        self.init(
            file: .init(file: chatPhoto.small),
            minithumbnail: MiniThumbnailState(chatPhoto.minithumbnail)
        )
    }

    init(profilePhoto: ProfilePhoto) {
        self.init(
            file: .init(file: profilePhoto.small),
            minithumbnail: MiniThumbnailState(profilePhoto.minithumbnail)
        )
    }
}

extension LocalFileState {
    init(file: File) {
        self.init(
            downloaded: file.local.isDownloadingCompleted,
            path: file.local.path
        )
    }
}

extension MiniThumbnailState {
    init?(_ minithumbnail: Minithumbnail?) {
        guard let thumbnail = minithumbnail else {
            return nil
        }
        self.init(data: thumbnail.data)
    }
}

extension VideoNoteState {
    convenience init(_ message: MessageVideoNote) {
        self.init(
            duration: message.videoNote.duration,
            thumbnail: .init(
                file: .init(file: message.videoNote.video),
                minithumbnail: MiniThumbnailState(message.videoNote.minithumbnail)
            ),
            unplayed: !message.isViewed
        )
    }
}

extension ContactState {
    convenience init(_ message: MessageContact) {
        self.init(
            name: "\(message.contact.firstName) \(message.contact.lastName)",
            phoneNumber: message.contact.phoneNumber
        )
    }
}

extension DocumentState {
    convenience init(_ message: MessageDocument) {
        self.init(
            fileName: message.caption.text.isEmpty ? message.document.fileName : message.caption.text,
            size: Int64(message.document.document.expectedSize)
        )
    }
}

extension UserState {
    init(_ response: User) {
        self.init(
            id: response.id,
            firstName: response.firstName,
            lastName: response.lastName,
            photo: response.profilePhoto.map(LocalPhotoState.init(profilePhoto:))
        )
    }
}

extension ChatState {
    init(_ response: Chat) {
        self.init(
            id: response.id,
            title: response.title,
            photo: response.photo.map(LocalPhotoState.init(chatPhoto:))
        )
    }
}

enum SenderDTO {
    case user(User)
    case chat(Chat)
}

extension MessageSenderState {
    init(_ sender: SenderDTO) {
        switch sender {
        case let .user(user):
            self = .user(.init(user))
        case let .chat(chat):
            self = .chat(.init(chat))
        }
    }
}

extension MessageState {
    init?(_ message: Message, sender: SenderDTO) {
        guard let content = MessageContentState(message.content) else {
            return nil
        }
        self.init(
            id: message.id,
            chatId: message.chatId,
            content: content,
            sender: .init(sender),
            date: Date(timeIntervalSince1970: Double(message.date)),
            isOutgoing: message.isOutgoing
        )
    }
}

extension MessageContentState {
    init?(_ message: MessageContent) {
        switch message {
        case let .messageText(text):
            self = .text(text.text.text)
        case let .messageAnimation:
            return nil
        case let .messageAudio(audio):
            self = .audio(.init(audio))
        case let .messageDocument(document):
            self = .document(.init(document))
        case let .messagePhoto(photo):
            self = .photo(.init(photo))
        case .messageExpiredPhoto:
            return nil
        case let .messageSticker(sticker):
            // TODO:
            return nil
        case let .messageVideo(video):
            self = .video(.init(video))
        case .messageExpiredVideo:
            return nil
        case let .messageVideoNote(videoNote):
            self = .videoNote(.init(videoNote))
        case .messageVoiceNote:
            return nil
        case let .messageLocation(location):
            self = .location(.init(location))
        case .messageVenue:
            return nil
        case let .messageContact(contact):
            self = .contact(.init(contact))
        case .messageDice:
            return nil
        case .messageGame:
            return nil
        case .messagePoll:
            // TODO:
            return nil
        case .messageInvoice:
            return nil
        case .messageCall:
            return nil

        case .messageVoiceChatScheduled:
            return nil
        case .messageVoiceChatStarted:
            return nil
        case .messageVoiceChatEnded:
            return nil
        case .messageBasicGroupChatCreate:
            return nil
        case .messageSupergroupChatCreate:
            return nil
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
            return nil
        }
    }
}

private extension Photo {
    var small: File {
        // https://core.telegram.org/api/files#image-thumbnail-types
        // TODO: sort all
        sizes.first(where: { $0.type == "m" || $0.type == "s" }).map(\.photo)!
    }
}
