import MapKit
import TGWatchUI

extension AudioState {
    convenience init(_ audio: MessageAudio) {
        self.init(
            title: audio.audio.title,
            caption: audio.caption.text,
            duration: audio.audio.duration,
            unplayed: false // TODO: ?
        )
    }

    convenience init(_ voice: MessageVoiceNote) {
        // TODO: voice & waveform
        self.init(
            title: voice.caption.text,
            caption: "",
            duration: voice.voiceNote.duration,
            unplayed: !voice.isListened
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
            thumbnail: .init(
                thumbnail: message.video.thumbnail.map(ThumbnailState.Thumbnail.init),
                minithumbnail: MiniThumbnailState(message.video.minithumbnail)
            )
        )
    }
}

extension ThumbnailState.Thumbnail {
    init(_ thumbnail: Thumbnail) {
        self.init(
            file: .init(file: thumbnail.file),
            format: Format(thumbnail.format),
            width: thumbnail.width,
            height: thumbnail.height
        )
    }
}

extension ThumbnailState {
    init(_ photo: Photo) {
        let size = photo.smallSize!
        self.init(
            thumbnail:
            .init(
                file: .init(file: size.photo),
                format: .jpg, // `PhotoSize` always contains JPEG
                width: size.width,
                height: size.height
            ),
            minithumbnail: .init(photo.minithumbnail)
        )
    }
}

extension PhotoState {
    init(_ message: MessagePhoto) {
        self.init(
            photo: .init(message.photo),
            caption: message.caption.text
        )
    }
}

extension ThumbnailState.Thumbnail.Format {
    init(_ format: ThumbnailFormat) {
        switch format {
        case .thumbnailFormatJpeg:
            self = .jpg
        case .thumbnailFormatPng:
            self = .png
        case .thumbnailFormatWebp:
            self = .webp
        case .thumbnailFormatGif:
            self = .gif
        case .thumbnailFormatTgs:
            self = .tgs
        case .thumbnailFormatMpeg4:
            self = .mpeg4
        }
    }
}

extension LocalFileState {
    init?(video: Video) {
        guard let thumbnail = video.thumbnail else {
            return nil
        }

        self.init(
            file: thumbnail.file
        )
    }

    init?(video: VideoNote) {
        guard let thumbnail = video.thumbnail else {
            return nil
        }

        self.init(
            file: thumbnail.file
        )
    }
}

extension ThumbnailState {
    init(chatPhoto: ChatPhotoInfo) {
        self.init(
            thumbnail: Thumbnail(
                file: .init(file: chatPhoto.small),
                format: .jpg, // `ChatPhotoInfo` always contains JPEG
                width: 160, height: 160
            ),
            minithumbnail: .init(chatPhoto.minithumbnail)
        )
    }

    init(profilePhoto: ProfilePhoto) {
        self.init(
            thumbnail: Thumbnail(
                file: .init(file: profilePhoto.small),
                format: .jpg, // `ProfilePhoto` always contains JPEG
                width: 160, height: 160
            ),
            minithumbnail: .init(profilePhoto.minithumbnail)
        )
    }
}

extension LocalFileState {
    init(file: File) {
        self.init(
            fileId: file.id,
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

/*
 .init(
     file: LocalFileState(video: message.videoNote),
     format: ThumbnailState.Format(message.videoNote.thumbnail?.format ?? .thumbnailFormatJpeg),
     minithumbnail: MiniThumbnailState(message.videoNote.minithumbnail)
 */
extension VideoNoteState {
    convenience init(_ message: MessageVideoNote) {
        self.init(
            duration: message.videoNote.duration,
            thumbnail:
            .init(
                thumbnail: message.videoNote.thumbnail.map(ThumbnailState.Thumbnail.init),
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
            photo: response.profilePhoto.map(ThumbnailState.init(profilePhoto:))
        )
    }
}

extension ChatState {
    init(_ response: Chat) {
        self.init(
            id: response.id,
            title: response.title,
            photo: response.photo.map(ThumbnailState.init(chatPhoto:)),
            lastMessageText: response.lastMessage?.lastMessageText ?? ""
        )
    }
}

extension StickerState {
    init(_ message: MessageSticker) {
        self.init(
            emoji: message.sticker.emoji,
            isAnimated: message.sticker.isAnimated,
            thumbnail: ThumbnailState(
                thumbnail: message.sticker.thumbnail.map(ThumbnailState.Thumbnail.init), minithumbnail: nil
            ),
            file: .init(file: message.sticker.sticker),
            width: message.sticker.width,
            height: message.sticker.height
        )
    }
}

extension PollState {
    init(_ poll: Poll) {
        self.init(
            // TODO: id
            question: poll.question,
            anonymous: poll.isAnonymous,
            closed: poll.isClosed,
            type: .init(poll.type),
            options: poll.options.map(PollState.Option.init)
        )
    }
}

extension PollState.PollType {
    init(_ type: PollType) {
        switch type {
        case let .pollTypeRegular(poll):
            self = .poll(multipleAnswers: poll.allowMultipleAnswers)
        case let .pollTypeQuiz(quiz):
            self = .quiz(correct: quiz.correctOptionId)
        }
    }
}

extension PollState.Option {
    init(_ option: PollOption) {
        // TODO: option.isBeingChosen
        self.init(text: option.text, chosen: option.isChosen, percentage: option.votePercentage)
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
    // > Viewing messages in chats, including text messages and all types of attachments:
    // > photos, videos, files, voice and video messages, locations, contacts, static and animated stickers, polls and quizzes.
    init?(_ message: MessageContent) {
        switch message {
        case let .messageText(text):
            self = .text(text.text.text)
        case .messageAnimation:
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
            self = .sticker(.init(sticker))
        case let .messageVideo(video):
            self = .video(.init(video))
        case .messageExpiredVideo:
            return nil
        case let .messageVideoNote(videoNote):
            self = .videoNote(.init(videoNote))
        case let .messageVoiceNote(voiceNote):
            self = .audio(.init(voiceNote))
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
        case let .messagePoll(message):
            self = .poll(.init(message.poll))
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
    var smallSize: PhotoSize? {
        // https://core.telegram.org/api/files#image-thumbnail-types
        let allSizes = ["s", "m", "x", "y", "w", "a", "b", "c", "d"]
        for i in 0 ..< allSizes.count {
            if let size = sizes.first(where: { $0.type == allSizes[i] }) {
                return size
            }
        }
        assertionFailure("Empty photo sizes")
        return nil
    }
}

// TODO: remove
extension Chat {
    var canSendMessages: Bool {
        // TODO: check channels
        permissions.canSendMessages
    }
}
