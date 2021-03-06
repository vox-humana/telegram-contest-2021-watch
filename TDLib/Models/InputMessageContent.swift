//
//  InputMessageContent.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// The content of a message to send
internal enum InputMessageContent: Codable {
    /// A text message
    case inputMessageText(InputMessageText)

    /// An animation message (GIF-style).
    case inputMessageAnimation(InputMessageAnimation)

    /// An audio message
    case inputMessageAudio(InputMessageAudio)

    /// A document message (general file)
    case inputMessageDocument(InputMessageDocument)

    /// A photo message
    case inputMessagePhoto(InputMessagePhoto)

    /// A sticker message
    case inputMessageSticker(InputMessageSticker)

    /// A video message
    case inputMessageVideo(InputMessageVideo)

    /// A video note message
    case inputMessageVideoNote(InputMessageVideoNote)

    /// A voice note message
    case inputMessageVoiceNote(InputMessageVoiceNote)

    /// A message with a location
    case inputMessageLocation(InputMessageLocation)

    /// A message with information about a venue
    case inputMessageVenue(InputMessageVenue)

    /// A message containing a user contact
    case inputMessageContact(InputMessageContact)

    /// A dice message
    case inputMessageDice(InputMessageDice)

    /// A message with a game; not supported for channels or secret chats
    case inputMessageGame(InputMessageGame)

    /// A message with an invoice; can be used only by bots
    case inputMessageInvoice(InputMessageInvoice)

    /// A message with a poll. Polls can't be sent to secret chats. Polls can be sent only to a private chat with a bot
    case inputMessagePoll(InputMessagePoll)

    /// A forwarded message
    case inputMessageForwarded(InputMessageForwarded)

    private enum Kind: String, Codable {
        case inputMessageText
        case inputMessageAnimation
        case inputMessageAudio
        case inputMessageDocument
        case inputMessagePhoto
        case inputMessageSticker
        case inputMessageVideo
        case inputMessageVideoNote
        case inputMessageVoiceNote
        case inputMessageLocation
        case inputMessageVenue
        case inputMessageContact
        case inputMessageDice
        case inputMessageGame
        case inputMessageInvoice
        case inputMessagePoll
        case inputMessageForwarded
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .inputMessageText:
            let value = try InputMessageText(from: decoder)
            self = .inputMessageText(value)
        case .inputMessageAnimation:
            let value = try InputMessageAnimation(from: decoder)
            self = .inputMessageAnimation(value)
        case .inputMessageAudio:
            let value = try InputMessageAudio(from: decoder)
            self = .inputMessageAudio(value)
        case .inputMessageDocument:
            let value = try InputMessageDocument(from: decoder)
            self = .inputMessageDocument(value)
        case .inputMessagePhoto:
            let value = try InputMessagePhoto(from: decoder)
            self = .inputMessagePhoto(value)
        case .inputMessageSticker:
            let value = try InputMessageSticker(from: decoder)
            self = .inputMessageSticker(value)
        case .inputMessageVideo:
            let value = try InputMessageVideo(from: decoder)
            self = .inputMessageVideo(value)
        case .inputMessageVideoNote:
            let value = try InputMessageVideoNote(from: decoder)
            self = .inputMessageVideoNote(value)
        case .inputMessageVoiceNote:
            let value = try InputMessageVoiceNote(from: decoder)
            self = .inputMessageVoiceNote(value)
        case .inputMessageLocation:
            let value = try InputMessageLocation(from: decoder)
            self = .inputMessageLocation(value)
        case .inputMessageVenue:
            let value = try InputMessageVenue(from: decoder)
            self = .inputMessageVenue(value)
        case .inputMessageContact:
            let value = try InputMessageContact(from: decoder)
            self = .inputMessageContact(value)
        case .inputMessageDice:
            let value = try InputMessageDice(from: decoder)
            self = .inputMessageDice(value)
        case .inputMessageGame:
            let value = try InputMessageGame(from: decoder)
            self = .inputMessageGame(value)
        case .inputMessageInvoice:
            let value = try InputMessageInvoice(from: decoder)
            self = .inputMessageInvoice(value)
        case .inputMessagePoll:
            let value = try InputMessagePoll(from: decoder)
            self = .inputMessagePoll(value)
        case .inputMessageForwarded:
            let value = try InputMessageForwarded(from: decoder)
            self = .inputMessageForwarded(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .inputMessageText(value):
            try container.encode(Kind.inputMessageText, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageAnimation(value):
            try container.encode(Kind.inputMessageAnimation, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageAudio(value):
            try container.encode(Kind.inputMessageAudio, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageDocument(value):
            try container.encode(Kind.inputMessageDocument, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessagePhoto(value):
            try container.encode(Kind.inputMessagePhoto, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageSticker(value):
            try container.encode(Kind.inputMessageSticker, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageVideo(value):
            try container.encode(Kind.inputMessageVideo, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageVideoNote(value):
            try container.encode(Kind.inputMessageVideoNote, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageVoiceNote(value):
            try container.encode(Kind.inputMessageVoiceNote, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageLocation(value):
            try container.encode(Kind.inputMessageLocation, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageVenue(value):
            try container.encode(Kind.inputMessageVenue, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageContact(value):
            try container.encode(Kind.inputMessageContact, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageDice(value):
            try container.encode(Kind.inputMessageDice, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageGame(value):
            try container.encode(Kind.inputMessageGame, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageInvoice(value):
            try container.encode(Kind.inputMessageInvoice, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessagePoll(value):
            try container.encode(Kind.inputMessagePoll, forKey: .type)
            try value.encode(to: encoder)
        case let .inputMessageForwarded(value):
            try container.encode(Kind.inputMessageForwarded, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A text message
internal struct InputMessageText: Codable {
    /// True, if a chat message draft should be deleted
    internal let clearDraft: Bool

    /// True, if rich web page previews for URLs in the message text should be disabled
    internal let disableWebPagePreview: Bool

    /// Formatted text to be sent; 1-GetOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Code, Pre, PreCode, TextUrl and MentionName entities are allowed to be specified manually
    internal let text: FormattedText

    internal init(
        clearDraft: Bool,
        disableWebPagePreview: Bool,
        text: FormattedText
    ) {
        self.clearDraft = clearDraft
        self.disableWebPagePreview = disableWebPagePreview
        self.text = text
    }
}

/// An animation message (GIF-style).
internal struct InputMessageAnimation: Codable {
    /// File identifiers of the stickers added to the animation, if applicable
    internal let addedStickerFileIds: [Int]

    /// Animation file to be sent
    internal let animation: InputFile

    /// Animation caption; 0-GetOption("message_caption_length_max") characters
    internal let caption: FormattedText

    /// Duration of the animation, in seconds
    internal let duration: Int

    /// Height of the animation; may be replaced by the server
    internal let height: Int

    /// Animation thumbnail, if available
    internal let thumbnail: InputThumbnail

    /// Width of the animation; may be replaced by the server
    internal let width: Int

    internal init(
        addedStickerFileIds: [Int],
        animation: InputFile,
        caption: FormattedText,
        duration: Int,
        height: Int,
        thumbnail: InputThumbnail,
        width: Int
    ) {
        self.addedStickerFileIds = addedStickerFileIds
        self.animation = animation
        self.caption = caption
        self.duration = duration
        self.height = height
        self.thumbnail = thumbnail
        self.width = width
    }
}

/// An audio message
internal struct InputMessageAudio: Codable {
    /// Thumbnail of the cover for the album, if available
    internal let albumCoverThumbnail: InputThumbnail

    /// Audio file to be sent
    internal let audio: InputFile

    /// Audio caption; 0-GetOption("message_caption_length_max") characters
    internal let caption: FormattedText

    /// Duration of the audio, in seconds; may be replaced by the server
    internal let duration: Int

    /// Performer of the audio; 0-64 characters, may be replaced by the server
    internal let performer: String

    /// Title of the audio; 0-64 characters; may be replaced by the server
    internal let title: String

    internal init(
        albumCoverThumbnail: InputThumbnail,
        audio: InputFile,
        caption: FormattedText,
        duration: Int,
        performer: String,
        title: String
    ) {
        self.albumCoverThumbnail = albumCoverThumbnail
        self.audio = audio
        self.caption = caption
        self.duration = duration
        self.performer = performer
        self.title = title
    }
}

/// A document message (general file)
internal struct InputMessageDocument: Codable {
    /// Document caption; 0-GetOption("message_caption_length_max") characters
    internal let caption: FormattedText

    /// If true, automatic file type detection will be disabled and the document will be always sent as file. Always true for files sent to secret chats
    internal let disableContentTypeDetection: Bool

    /// Document to be sent
    internal let document: InputFile

    /// Document thumbnail, if available
    internal let thumbnail: InputThumbnail

    internal init(
        caption: FormattedText,
        disableContentTypeDetection: Bool,
        document: InputFile,
        thumbnail: InputThumbnail
    ) {
        self.caption = caption
        self.disableContentTypeDetection = disableContentTypeDetection
        self.document = document
        self.thumbnail = thumbnail
    }
}

/// A photo message
internal struct InputMessagePhoto: Codable {
    /// File identifiers of the stickers added to the photo, if applicable
    internal let addedStickerFileIds: [Int]

    /// Photo caption; 0-GetOption("message_caption_length_max") characters
    internal let caption: FormattedText

    /// Photo height
    internal let height: Int

    /// Photo to send
    internal let photo: InputFile

    /// Photo thumbnail to be sent, this is sent to the other party in secret chats only
    internal let thumbnail: InputThumbnail

    /// Photo TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
    internal let ttl: Int

    /// Photo width
    internal let width: Int

    internal init(
        addedStickerFileIds: [Int],
        caption: FormattedText,
        height: Int,
        photo: InputFile,
        thumbnail: InputThumbnail,
        ttl: Int,
        width: Int
    ) {
        self.addedStickerFileIds = addedStickerFileIds
        self.caption = caption
        self.height = height
        self.photo = photo
        self.thumbnail = thumbnail
        self.ttl = ttl
        self.width = width
    }
}

/// A sticker message
internal struct InputMessageSticker: Codable {
    /// Emoji used to choose the sticker
    internal let emoji: String

    /// Sticker height
    internal let height: Int

    /// Sticker to be sent
    internal let sticker: InputFile

    /// Sticker thumbnail, if available
    internal let thumbnail: InputThumbnail

    /// Sticker width
    internal let width: Int

    internal init(
        emoji: String,
        height: Int,
        sticker: InputFile,
        thumbnail: InputThumbnail,
        width: Int
    ) {
        self.emoji = emoji
        self.height = height
        self.sticker = sticker
        self.thumbnail = thumbnail
        self.width = width
    }
}

/// A video message
internal struct InputMessageVideo: Codable {
    /// File identifiers of the stickers added to the video, if applicable
    internal let addedStickerFileIds: [Int]

    /// Video caption; 0-GetOption("message_caption_length_max") characters
    internal let caption: FormattedText

    /// Duration of the video, in seconds
    internal let duration: Int

    /// Video height
    internal let height: Int

    /// True, if the video should be tried to be streamed
    internal let supportsStreaming: Bool

    /// Video thumbnail, if available
    internal let thumbnail: InputThumbnail

    /// Video TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
    internal let ttl: Int

    /// Video to be sent
    internal let video: InputFile

    /// Video width
    internal let width: Int

    internal init(
        addedStickerFileIds: [Int],
        caption: FormattedText,
        duration: Int,
        height: Int,
        supportsStreaming: Bool,
        thumbnail: InputThumbnail,
        ttl: Int,
        video: InputFile,
        width: Int
    ) {
        self.addedStickerFileIds = addedStickerFileIds
        self.caption = caption
        self.duration = duration
        self.height = height
        self.supportsStreaming = supportsStreaming
        self.thumbnail = thumbnail
        self.ttl = ttl
        self.video = video
        self.width = width
    }
}

/// A video note message
internal struct InputMessageVideoNote: Codable {
    /// Duration of the video, in seconds
    internal let duration: Int

    /// Video width and height; must be positive and not greater than 640
    internal let length: Int

    /// Video thumbnail, if available
    internal let thumbnail: InputThumbnail

    /// Video note to be sent
    internal let videoNote: InputFile

    internal init(
        duration: Int,
        length: Int,
        thumbnail: InputThumbnail,
        videoNote: InputFile
    ) {
        self.duration = duration
        self.length = length
        self.thumbnail = thumbnail
        self.videoNote = videoNote
    }
}

/// A voice note message
internal struct InputMessageVoiceNote: Codable {
    /// Voice note caption; 0-GetOption("message_caption_length_max") characters
    internal let caption: FormattedText

    /// Duration of the voice note, in seconds
    internal let duration: Int

    /// Voice note to be sent
    internal let voiceNote: InputFile

    /// Waveform representation of the voice note, in 5-bit format
    internal let waveform: Data

    internal init(
        caption: FormattedText,
        duration: Int,
        voiceNote: InputFile,
        waveform: Data
    ) {
        self.caption = caption
        self.duration = duration
        self.voiceNote = voiceNote
        self.waveform = waveform
    }
}

/// A message with a location
internal struct InputMessageLocation: Codable {
    /// For live locations, a direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
    internal let heading: Int

    /// Period for which the location can be updated, in seconds; should be between 60 and 86400 for a live location and 0 otherwise
    internal let livePeriod: Int

    /// Location to be sent
    internal let location: Location

    /// For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled. Can't be enabled in channels and Saved Messages
    internal let proximityAlertRadius: Int

    internal init(
        heading: Int,
        livePeriod: Int,
        location: Location,
        proximityAlertRadius: Int
    ) {
        self.heading = heading
        self.livePeriod = livePeriod
        self.location = location
        self.proximityAlertRadius = proximityAlertRadius
    }
}

/// A message with information about a venue
internal struct InputMessageVenue: Codable {
    /// Venue to send
    internal let venue: Venue

    internal init(venue: Venue) {
        self.venue = venue
    }
}

/// A message containing a user contact
internal struct InputMessageContact: Codable {
    /// Contact to send
    internal let contact: Contact

    internal init(contact: Contact) {
        self.contact = contact
    }
}

/// A dice message
internal struct InputMessageDice: Codable {
    /// True, if a chat message draft should be deleted
    internal let clearDraft: Bool

    /// Emoji on which the dice throw animation is based
    internal let emoji: String

    internal init(
        clearDraft: Bool,
        emoji: String
    ) {
        self.clearDraft = clearDraft
        self.emoji = emoji
    }
}

/// A message with a game; not supported for channels or secret chats
internal struct InputMessageGame: Codable {
    /// User identifier of the bot that owns the game
    internal let botUserId: Int

    /// Short name of the game
    internal let gameShortName: String

    internal init(
        botUserId: Int,
        gameShortName: String
    ) {
        self.botUserId = botUserId
        self.gameShortName = gameShortName
    }
}

/// A message with an invoice; can be used only by bots
internal struct InputMessageInvoice: Codable {
    internal let description: String

    /// Invoice
    internal let invoice: Invoice

    /// The invoice payload
    internal let payload: Data

    /// Product photo height
    internal let photoHeight: Int

    /// Product photo size
    internal let photoSize: Int

    /// Product photo URL; optional
    internal let photoUrl: String

    /// Product photo width
    internal let photoWidth: Int

    /// JSON-encoded data about the invoice, which will be shared with the payment provider
    internal let providerData: String

    /// Payment provider token
    internal let providerToken: String

    /// Unique invoice bot deep link parameter for the generation of this invoice. If empty, it would be possible to pay directly from forwards of the invoice message
    internal let startParameter: String

    /// Product title; 1-32 characters
    internal let title: String

    internal init(
        description: String,
        invoice: Invoice,
        payload: Data,
        photoHeight: Int,
        photoSize: Int,
        photoUrl: String,
        photoWidth: Int,
        providerData: String,
        providerToken: String,
        startParameter: String,
        title: String
    ) {
        self.description = description
        self.invoice = invoice
        self.payload = payload
        self.photoHeight = photoHeight
        self.photoSize = photoSize
        self.photoUrl = photoUrl
        self.photoWidth = photoWidth
        self.providerData = providerData
        self.providerToken = providerToken
        self.startParameter = startParameter
        self.title = title
    }
}

/// A message with a poll. Polls can't be sent to secret chats. Polls can be sent only to a private chat with a bot
internal struct InputMessagePoll: Codable {
    /// Point in time (Unix timestamp) when the poll will be automatically closed; for bots only
    internal let closeDate: Int

    /// True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels
    internal let isAnonymous: Bool

    /// True, if the poll needs to be sent already closed; for bots only
    internal let isClosed: Bool

    /// Amount of time the poll will be active after creation, in seconds; for bots only
    internal let openPeriod: Int

    /// List of poll answer options, 2-10 strings 1-100 characters each
    internal let options: [String]

    /// Poll question; 1-255 characters (up to 300 characters for bots)
    internal let question: String

    /// Type of the poll
    internal let type: PollType

    internal init(
        closeDate: Int,
        isAnonymous: Bool,
        isClosed: Bool,
        openPeriod: Int,
        options: [String],
        question: String,
        type: PollType
    ) {
        self.closeDate = closeDate
        self.isAnonymous = isAnonymous
        self.isClosed = isClosed
        self.openPeriod = openPeriod
        self.options = options
        self.question = question
        self.type = type
    }
}

/// A forwarded message
internal struct InputMessageForwarded: Codable {
    /// Options to be used to copy content of the message without a link to the original message
    internal let copyOptions: MessageCopyOptions

    /// Identifier for the chat this forwarded message came from
    internal let fromChatId: Int64

    /// True, if a game message should be shared within a launched game; applies only to game messages
    internal let inGameShare: Bool

    /// Identifier of the message to forward
    internal let messageId: Int64

    internal init(
        copyOptions: MessageCopyOptions,
        fromChatId: Int64,
        inGameShare: Bool,
        messageId: Int64
    ) {
        self.copyOptions = copyOptions
        self.fromChatId = fromChatId
        self.inGameShare = inGameShare
        self.messageId = messageId
    }
}
