//
//  PushMessageContent.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains content of a push message notification
internal enum PushMessageContent: Codable {
    /// A general message with hidden content
    case pushMessageContentHidden(PushMessageContentHidden)

    /// An animation message (GIF-style).
    case pushMessageContentAnimation(PushMessageContentAnimation)

    /// An audio message
    case pushMessageContentAudio(PushMessageContentAudio)

    /// A message with a user contact
    case pushMessageContentContact(PushMessageContentContact)

    /// A contact has registered with Telegram
    case pushMessageContentContactRegistered

    /// A document message (a general file)
    case pushMessageContentDocument(PushMessageContentDocument)

    /// A message with a game
    case pushMessageContentGame(PushMessageContentGame)

    /// A new high score was achieved in a game
    case pushMessageContentGameScore(PushMessageContentGameScore)

    /// A message with an invoice from a bot
    case pushMessageContentInvoice(PushMessageContentInvoice)

    /// A message with a location
    case pushMessageContentLocation(PushMessageContentLocation)

    /// A photo message
    case pushMessageContentPhoto(PushMessageContentPhoto)

    /// A message with a poll
    case pushMessageContentPoll(PushMessageContentPoll)

    /// A screenshot of a message in the chat has been taken
    case pushMessageContentScreenshotTaken

    /// A message with a sticker
    case pushMessageContentSticker(PushMessageContentSticker)

    /// A text message
    case pushMessageContentText(PushMessageContentText)

    /// A video message
    case pushMessageContentVideo(PushMessageContentVideo)

    /// A video note message
    case pushMessageContentVideoNote(PushMessageContentVideoNote)

    /// A voice note message
    case pushMessageContentVoiceNote(PushMessageContentVoiceNote)

    /// A newly created basic group
    case pushMessageContentBasicGroupChatCreate

    /// New chat members were invited to a group
    case pushMessageContentChatAddMembers(PushMessageContentChatAddMembers)

    /// A chat photo was edited
    case pushMessageContentChatChangePhoto

    /// A chat title was edited
    case pushMessageContentChatChangeTitle(PushMessageContentChatChangeTitle)

    /// A chat member was deleted
    case pushMessageContentChatDeleteMember(PushMessageContentChatDeleteMember)

    /// A new member joined the chat by invite link
    case pushMessageContentChatJoinByLink

    /// A forwarded messages
    case pushMessageContentMessageForwards(PushMessageContentMessageForwards)

    /// A media album
    case pushMessageContentMediaAlbum(PushMessageContentMediaAlbum)

    private enum Kind: String, Codable {
        case pushMessageContentHidden
        case pushMessageContentAnimation
        case pushMessageContentAudio
        case pushMessageContentContact
        case pushMessageContentContactRegistered
        case pushMessageContentDocument
        case pushMessageContentGame
        case pushMessageContentGameScore
        case pushMessageContentInvoice
        case pushMessageContentLocation
        case pushMessageContentPhoto
        case pushMessageContentPoll
        case pushMessageContentScreenshotTaken
        case pushMessageContentSticker
        case pushMessageContentText
        case pushMessageContentVideo
        case pushMessageContentVideoNote
        case pushMessageContentVoiceNote
        case pushMessageContentBasicGroupChatCreate
        case pushMessageContentChatAddMembers
        case pushMessageContentChatChangePhoto
        case pushMessageContentChatChangeTitle
        case pushMessageContentChatDeleteMember
        case pushMessageContentChatJoinByLink
        case pushMessageContentMessageForwards
        case pushMessageContentMediaAlbum
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .pushMessageContentHidden:
            let value = try PushMessageContentHidden(from: decoder)
            self = .pushMessageContentHidden(value)
        case .pushMessageContentAnimation:
            let value = try PushMessageContentAnimation(from: decoder)
            self = .pushMessageContentAnimation(value)
        case .pushMessageContentAudio:
            let value = try PushMessageContentAudio(from: decoder)
            self = .pushMessageContentAudio(value)
        case .pushMessageContentContact:
            let value = try PushMessageContentContact(from: decoder)
            self = .pushMessageContentContact(value)
        case .pushMessageContentContactRegistered:
            self = .pushMessageContentContactRegistered
        case .pushMessageContentDocument:
            let value = try PushMessageContentDocument(from: decoder)
            self = .pushMessageContentDocument(value)
        case .pushMessageContentGame:
            let value = try PushMessageContentGame(from: decoder)
            self = .pushMessageContentGame(value)
        case .pushMessageContentGameScore:
            let value = try PushMessageContentGameScore(from: decoder)
            self = .pushMessageContentGameScore(value)
        case .pushMessageContentInvoice:
            let value = try PushMessageContentInvoice(from: decoder)
            self = .pushMessageContentInvoice(value)
        case .pushMessageContentLocation:
            let value = try PushMessageContentLocation(from: decoder)
            self = .pushMessageContentLocation(value)
        case .pushMessageContentPhoto:
            let value = try PushMessageContentPhoto(from: decoder)
            self = .pushMessageContentPhoto(value)
        case .pushMessageContentPoll:
            let value = try PushMessageContentPoll(from: decoder)
            self = .pushMessageContentPoll(value)
        case .pushMessageContentScreenshotTaken:
            self = .pushMessageContentScreenshotTaken
        case .pushMessageContentSticker:
            let value = try PushMessageContentSticker(from: decoder)
            self = .pushMessageContentSticker(value)
        case .pushMessageContentText:
            let value = try PushMessageContentText(from: decoder)
            self = .pushMessageContentText(value)
        case .pushMessageContentVideo:
            let value = try PushMessageContentVideo(from: decoder)
            self = .pushMessageContentVideo(value)
        case .pushMessageContentVideoNote:
            let value = try PushMessageContentVideoNote(from: decoder)
            self = .pushMessageContentVideoNote(value)
        case .pushMessageContentVoiceNote:
            let value = try PushMessageContentVoiceNote(from: decoder)
            self = .pushMessageContentVoiceNote(value)
        case .pushMessageContentBasicGroupChatCreate:
            self = .pushMessageContentBasicGroupChatCreate
        case .pushMessageContentChatAddMembers:
            let value = try PushMessageContentChatAddMembers(from: decoder)
            self = .pushMessageContentChatAddMembers(value)
        case .pushMessageContentChatChangePhoto:
            self = .pushMessageContentChatChangePhoto
        case .pushMessageContentChatChangeTitle:
            let value = try PushMessageContentChatChangeTitle(from: decoder)
            self = .pushMessageContentChatChangeTitle(value)
        case .pushMessageContentChatDeleteMember:
            let value = try PushMessageContentChatDeleteMember(from: decoder)
            self = .pushMessageContentChatDeleteMember(value)
        case .pushMessageContentChatJoinByLink:
            self = .pushMessageContentChatJoinByLink
        case .pushMessageContentMessageForwards:
            let value = try PushMessageContentMessageForwards(from: decoder)
            self = .pushMessageContentMessageForwards(value)
        case .pushMessageContentMediaAlbum:
            let value = try PushMessageContentMediaAlbum(from: decoder)
            self = .pushMessageContentMediaAlbum(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .pushMessageContentHidden(value):
            try container.encode(Kind.pushMessageContentHidden, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentAnimation(value):
            try container.encode(Kind.pushMessageContentAnimation, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentAudio(value):
            try container.encode(Kind.pushMessageContentAudio, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentContact(value):
            try container.encode(Kind.pushMessageContentContact, forKey: .type)
            try value.encode(to: encoder)
        case .pushMessageContentContactRegistered:
            try container.encode(Kind.pushMessageContentContactRegistered, forKey: .type)
        case let .pushMessageContentDocument(value):
            try container.encode(Kind.pushMessageContentDocument, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentGame(value):
            try container.encode(Kind.pushMessageContentGame, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentGameScore(value):
            try container.encode(Kind.pushMessageContentGameScore, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentInvoice(value):
            try container.encode(Kind.pushMessageContentInvoice, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentLocation(value):
            try container.encode(Kind.pushMessageContentLocation, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentPhoto(value):
            try container.encode(Kind.pushMessageContentPhoto, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentPoll(value):
            try container.encode(Kind.pushMessageContentPoll, forKey: .type)
            try value.encode(to: encoder)
        case .pushMessageContentScreenshotTaken:
            try container.encode(Kind.pushMessageContentScreenshotTaken, forKey: .type)
        case let .pushMessageContentSticker(value):
            try container.encode(Kind.pushMessageContentSticker, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentText(value):
            try container.encode(Kind.pushMessageContentText, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentVideo(value):
            try container.encode(Kind.pushMessageContentVideo, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentVideoNote(value):
            try container.encode(Kind.pushMessageContentVideoNote, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentVoiceNote(value):
            try container.encode(Kind.pushMessageContentVoiceNote, forKey: .type)
            try value.encode(to: encoder)
        case .pushMessageContentBasicGroupChatCreate:
            try container.encode(Kind.pushMessageContentBasicGroupChatCreate, forKey: .type)
        case let .pushMessageContentChatAddMembers(value):
            try container.encode(Kind.pushMessageContentChatAddMembers, forKey: .type)
            try value.encode(to: encoder)
        case .pushMessageContentChatChangePhoto:
            try container.encode(Kind.pushMessageContentChatChangePhoto, forKey: .type)
        case let .pushMessageContentChatChangeTitle(value):
            try container.encode(Kind.pushMessageContentChatChangeTitle, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentChatDeleteMember(value):
            try container.encode(Kind.pushMessageContentChatDeleteMember, forKey: .type)
            try value.encode(to: encoder)
        case .pushMessageContentChatJoinByLink:
            try container.encode(Kind.pushMessageContentChatJoinByLink, forKey: .type)
        case let .pushMessageContentMessageForwards(value):
            try container.encode(Kind.pushMessageContentMessageForwards, forKey: .type)
            try value.encode(to: encoder)
        case let .pushMessageContentMediaAlbum(value):
            try container.encode(Kind.pushMessageContentMediaAlbum, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A general message with hidden content
internal struct PushMessageContentHidden: Codable {
    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    internal init(isPinned: Bool) {
        self.isPinned = isPinned
    }
}

/// An animation message (GIF-style).
internal struct PushMessageContentAnimation: Codable {
    /// Message content; may be null
    internal let animation: Animation?

    /// Animation caption
    internal let caption: String

    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    internal init(
        animation: Animation?,
        caption: String,
        isPinned: Bool
    ) {
        self.animation = animation
        self.caption = caption
        self.isPinned = isPinned
    }
}

/// An audio message
internal struct PushMessageContentAudio: Codable {
    /// Message content; may be null
    internal let audio: Audio?

    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    internal init(
        audio: Audio?,
        isPinned: Bool
    ) {
        self.audio = audio
        self.isPinned = isPinned
    }
}

/// A message with a user contact
internal struct PushMessageContentContact: Codable {
    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// Contact's name
    internal let name: String

    internal init(
        isPinned: Bool,
        name: String
    ) {
        self.isPinned = isPinned
        self.name = name
    }
}

/// A document message (a general file)
internal struct PushMessageContentDocument: Codable {
    /// Message content; may be null
    internal let document: Document?

    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    internal init(
        document: Document?,
        isPinned: Bool
    ) {
        self.document = document
        self.isPinned = isPinned
    }
}

/// A message with a game
internal struct PushMessageContentGame: Codable {
    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// Game title, empty for pinned game message
    internal let title: String

    internal init(
        isPinned: Bool,
        title: String
    ) {
        self.isPinned = isPinned
        self.title = title
    }
}

/// A new high score was achieved in a game
internal struct PushMessageContentGameScore: Codable {
    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// New score, 0 for pinned message
    internal let score: Int

    /// Game title, empty for pinned message
    internal let title: String

    internal init(
        isPinned: Bool,
        score: Int,
        title: String
    ) {
        self.isPinned = isPinned
        self.score = score
        self.title = title
    }
}

/// A message with an invoice from a bot
internal struct PushMessageContentInvoice: Codable {
    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// Product price
    internal let price: String

    internal init(
        isPinned: Bool,
        price: String
    ) {
        self.isPinned = isPinned
        self.price = price
    }
}

/// A message with a location
internal struct PushMessageContentLocation: Codable {
    /// True, if the location is live
    internal let isLive: Bool

    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    internal init(
        isLive: Bool,
        isPinned: Bool
    ) {
        self.isLive = isLive
        self.isPinned = isPinned
    }
}

/// A photo message
internal struct PushMessageContentPhoto: Codable {
    /// Photo caption
    internal let caption: String

    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// True, if the photo is secret
    internal let isSecret: Bool

    /// Message content; may be null
    internal let photo: Photo?

    internal init(
        caption: String,
        isPinned: Bool,
        isSecret: Bool,
        photo: Photo?
    ) {
        self.caption = caption
        self.isPinned = isPinned
        self.isSecret = isSecret
        self.photo = photo
    }
}

/// A message with a poll
internal struct PushMessageContentPoll: Codable {
    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// True, if the poll is regular and not in quiz mode
    internal let isRegular: Bool

    /// Poll question
    internal let question: String

    internal init(
        isPinned: Bool,
        isRegular: Bool,
        question: String
    ) {
        self.isPinned = isPinned
        self.isRegular = isRegular
        self.question = question
    }
}

/// A message with a sticker
internal struct PushMessageContentSticker: Codable {
    /// Emoji corresponding to the sticker; may be empty
    internal let emoji: String

    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// Message content; may be null
    internal let sticker: Sticker?

    internal init(
        emoji: String,
        isPinned: Bool,
        sticker: Sticker?
    ) {
        self.emoji = emoji
        self.isPinned = isPinned
        self.sticker = sticker
    }
}

/// A text message
internal struct PushMessageContentText: Codable {
    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// Message text
    internal let text: String

    internal init(
        isPinned: Bool,
        text: String
    ) {
        self.isPinned = isPinned
        self.text = text
    }
}

/// A video message
internal struct PushMessageContentVideo: Codable {
    /// Video caption
    internal let caption: String

    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// True, if the video is secret
    internal let isSecret: Bool

    /// Message content; may be null
    internal let video: Video?

    internal init(
        caption: String,
        isPinned: Bool,
        isSecret: Bool,
        video: Video?
    ) {
        self.caption = caption
        self.isPinned = isPinned
        self.isSecret = isSecret
        self.video = video
    }
}

/// A video note message
internal struct PushMessageContentVideoNote: Codable {
    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// Message content; may be null
    internal let videoNote: VideoNote?

    internal init(
        isPinned: Bool,
        videoNote: VideoNote?
    ) {
        self.isPinned = isPinned
        self.videoNote = videoNote
    }
}

/// A voice note message
internal struct PushMessageContentVoiceNote: Codable {
    /// True, if the message is a pinned message with the specified content
    internal let isPinned: Bool

    /// Message content; may be null
    internal let voiceNote: VoiceNote?

    internal init(
        isPinned: Bool,
        voiceNote: VoiceNote?
    ) {
        self.isPinned = isPinned
        self.voiceNote = voiceNote
    }
}

/// New chat members were invited to a group
internal struct PushMessageContentChatAddMembers: Codable {
    /// True, if the current user was added to the group
    internal let isCurrentUser: Bool

    /// True, if the user has returned to the group themself
    internal let isReturned: Bool

    /// Name of the added member
    internal let memberName: String

    internal init(
        isCurrentUser: Bool,
        isReturned: Bool,
        memberName: String
    ) {
        self.isCurrentUser = isCurrentUser
        self.isReturned = isReturned
        self.memberName = memberName
    }
}

/// A chat title was edited
internal struct PushMessageContentChatChangeTitle: Codable {
    /// New chat title
    internal let title: String

    internal init(title: String) {
        self.title = title
    }
}

/// A chat member was deleted
internal struct PushMessageContentChatDeleteMember: Codable {
    /// True, if the current user was deleted from the group
    internal let isCurrentUser: Bool

    /// True, if the user has left the group themself
    internal let isLeft: Bool

    /// Name of the deleted member
    internal let memberName: String

    internal init(
        isCurrentUser: Bool,
        isLeft: Bool,
        memberName: String
    ) {
        self.isCurrentUser = isCurrentUser
        self.isLeft = isLeft
        self.memberName = memberName
    }
}

/// A forwarded messages
internal struct PushMessageContentMessageForwards: Codable {
    /// Number of forwarded messages
    internal let totalCount: Int

    internal init(totalCount: Int) {
        self.totalCount = totalCount
    }
}

/// A media album
internal struct PushMessageContentMediaAlbum: Codable {
    /// True, if the album has at least one audio file
    internal let hasAudios: Bool

    /// True, if the album has at least one document
    internal let hasDocuments: Bool

    /// True, if the album has at least one photo
    internal let hasPhotos: Bool

    /// True, if the album has at least one video
    internal let hasVideos: Bool

    /// Number of messages in the album
    internal let totalCount: Int

    internal init(
        hasAudios: Bool,
        hasDocuments: Bool,
        hasPhotos: Bool,
        hasVideos: Bool,
        totalCount: Int
    ) {
        self.hasAudios = hasAudios
        self.hasDocuments = hasDocuments
        self.hasPhotos = hasPhotos
        self.hasVideos = hasVideos
        self.totalCount = totalCount
    }
}
