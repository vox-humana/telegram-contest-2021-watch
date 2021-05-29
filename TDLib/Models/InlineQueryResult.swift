//
//  InlineQueryResult.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a single result of an inline query
internal enum InlineQueryResult: Codable {
    /// Represents a link to an article or web page
    case inlineQueryResultArticle(InlineQueryResultArticle)

    /// Represents a user contact
    case inlineQueryResultContact(InlineQueryResultContact)

    /// Represents a point on the map
    case inlineQueryResultLocation(InlineQueryResultLocation)

    /// Represents information about a venue
    case inlineQueryResultVenue(InlineQueryResultVenue)

    /// Represents information about a game
    case inlineQueryResultGame(InlineQueryResultGame)

    /// Represents an animation file
    case inlineQueryResultAnimation(InlineQueryResultAnimation)

    /// Represents an audio file
    case inlineQueryResultAudio(InlineQueryResultAudio)

    /// Represents a document
    case inlineQueryResultDocument(InlineQueryResultDocument)

    /// Represents a photo
    case inlineQueryResultPhoto(InlineQueryResultPhoto)

    /// Represents a sticker
    case inlineQueryResultSticker(InlineQueryResultSticker)

    /// Represents a video
    case inlineQueryResultVideo(InlineQueryResultVideo)

    /// Represents a voice note
    case inlineQueryResultVoiceNote(InlineQueryResultVoiceNote)

    private enum Kind: String, Codable {
        case inlineQueryResultArticle
        case inlineQueryResultContact
        case inlineQueryResultLocation
        case inlineQueryResultVenue
        case inlineQueryResultGame
        case inlineQueryResultAnimation
        case inlineQueryResultAudio
        case inlineQueryResultDocument
        case inlineQueryResultPhoto
        case inlineQueryResultSticker
        case inlineQueryResultVideo
        case inlineQueryResultVoiceNote
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .inlineQueryResultArticle:
            let value = try InlineQueryResultArticle(from: decoder)
            self = .inlineQueryResultArticle(value)
        case .inlineQueryResultContact:
            let value = try InlineQueryResultContact(from: decoder)
            self = .inlineQueryResultContact(value)
        case .inlineQueryResultLocation:
            let value = try InlineQueryResultLocation(from: decoder)
            self = .inlineQueryResultLocation(value)
        case .inlineQueryResultVenue:
            let value = try InlineQueryResultVenue(from: decoder)
            self = .inlineQueryResultVenue(value)
        case .inlineQueryResultGame:
            let value = try InlineQueryResultGame(from: decoder)
            self = .inlineQueryResultGame(value)
        case .inlineQueryResultAnimation:
            let value = try InlineQueryResultAnimation(from: decoder)
            self = .inlineQueryResultAnimation(value)
        case .inlineQueryResultAudio:
            let value = try InlineQueryResultAudio(from: decoder)
            self = .inlineQueryResultAudio(value)
        case .inlineQueryResultDocument:
            let value = try InlineQueryResultDocument(from: decoder)
            self = .inlineQueryResultDocument(value)
        case .inlineQueryResultPhoto:
            let value = try InlineQueryResultPhoto(from: decoder)
            self = .inlineQueryResultPhoto(value)
        case .inlineQueryResultSticker:
            let value = try InlineQueryResultSticker(from: decoder)
            self = .inlineQueryResultSticker(value)
        case .inlineQueryResultVideo:
            let value = try InlineQueryResultVideo(from: decoder)
            self = .inlineQueryResultVideo(value)
        case .inlineQueryResultVoiceNote:
            let value = try InlineQueryResultVoiceNote(from: decoder)
            self = .inlineQueryResultVoiceNote(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .inlineQueryResultArticle(value):
            try container.encode(Kind.inlineQueryResultArticle, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultContact(value):
            try container.encode(Kind.inlineQueryResultContact, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultLocation(value):
            try container.encode(Kind.inlineQueryResultLocation, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultVenue(value):
            try container.encode(Kind.inlineQueryResultVenue, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultGame(value):
            try container.encode(Kind.inlineQueryResultGame, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultAnimation(value):
            try container.encode(Kind.inlineQueryResultAnimation, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultAudio(value):
            try container.encode(Kind.inlineQueryResultAudio, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultDocument(value):
            try container.encode(Kind.inlineQueryResultDocument, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultPhoto(value):
            try container.encode(Kind.inlineQueryResultPhoto, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultSticker(value):
            try container.encode(Kind.inlineQueryResultSticker, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultVideo(value):
            try container.encode(Kind.inlineQueryResultVideo, forKey: .type)
            try value.encode(to: encoder)
        case let .inlineQueryResultVoiceNote(value):
            try container.encode(Kind.inlineQueryResultVoiceNote, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// Represents a link to an article or web page
internal struct InlineQueryResultArticle: Codable {
    internal let description: String

    /// True, if the URL must be not shown
    internal let hideUrl: Bool

    /// Unique identifier of the query result
    internal let id: String

    /// Result thumbnail in JPEG format; may be null
    internal let thumbnail: Thumbnail?

    /// Title of the result
    internal let title: String

    /// URL of the result, if it exists
    internal let url: String

    internal init(
        description: String,
        hideUrl: Bool,
        id: String,
        thumbnail: Thumbnail?,
        title: String,
        url: String
    ) {
        self.description = description
        self.hideUrl = hideUrl
        self.id = id
        self.thumbnail = thumbnail
        self.title = title
        self.url = url
    }
}

/// Represents a user contact
internal struct InlineQueryResultContact: Codable {
    /// A user contact
    internal let contact: Contact

    /// Unique identifier of the query result
    internal let id: String

    /// Result thumbnail in JPEG format; may be null
    internal let thumbnail: Thumbnail?

    internal init(
        contact: Contact,
        id: String,
        thumbnail: Thumbnail?
    ) {
        self.contact = contact
        self.id = id
        self.thumbnail = thumbnail
    }
}

/// Represents a point on the map
internal struct InlineQueryResultLocation: Codable {
    /// Unique identifier of the query result
    internal let id: String

    /// Location result
    internal let location: Location

    /// Result thumbnail in JPEG format; may be null
    internal let thumbnail: Thumbnail?

    /// Title of the result
    internal let title: String

    internal init(
        id: String,
        location: Location,
        thumbnail: Thumbnail?,
        title: String
    ) {
        self.id = id
        self.location = location
        self.thumbnail = thumbnail
        self.title = title
    }
}

/// Represents information about a venue
internal struct InlineQueryResultVenue: Codable {
    /// Unique identifier of the query result
    internal let id: String

    /// Result thumbnail in JPEG format; may be null
    internal let thumbnail: Thumbnail?

    /// Venue result
    internal let venue: Venue

    internal init(
        id: String,
        thumbnail: Thumbnail?,
        venue: Venue
    ) {
        self.id = id
        self.thumbnail = thumbnail
        self.venue = venue
    }
}

/// Represents information about a game
internal struct InlineQueryResultGame: Codable {
    /// Game result
    internal let game: Game

    /// Unique identifier of the query result
    internal let id: String

    internal init(
        game: Game,
        id: String
    ) {
        self.game = game
        self.id = id
    }
}

/// Represents an animation file
internal struct InlineQueryResultAnimation: Codable {
    /// Animation file
    internal let animation: Animation

    /// Unique identifier of the query result
    internal let id: String

    /// Animation title
    internal let title: String

    internal init(
        animation: Animation,
        id: String,
        title: String
    ) {
        self.animation = animation
        self.id = id
        self.title = title
    }
}

/// Represents an audio file
internal struct InlineQueryResultAudio: Codable {
    /// Audio file
    internal let audio: Audio

    /// Unique identifier of the query result
    internal let id: String

    internal init(
        audio: Audio,
        id: String
    ) {
        self.audio = audio
        self.id = id
    }
}

/// Represents a document
internal struct InlineQueryResultDocument: Codable {
    internal let description: String

    /// Document
    internal let document: Document

    /// Unique identifier of the query result
    internal let id: String

    /// Document title
    internal let title: String

    internal init(
        description: String,
        document: Document,
        id: String,
        title: String
    ) {
        self.description = description
        self.document = document
        self.id = id
        self.title = title
    }
}

/// Represents a photo
internal struct InlineQueryResultPhoto: Codable {
    internal let description: String

    /// Unique identifier of the query result
    internal let id: String

    /// Photo
    internal let photo: Photo

    /// Title of the result, if known
    internal let title: String

    internal init(
        description: String,
        id: String,
        photo: Photo,
        title: String
    ) {
        self.description = description
        self.id = id
        self.photo = photo
        self.title = title
    }
}

/// Represents a sticker
internal struct InlineQueryResultSticker: Codable {
    /// Unique identifier of the query result
    internal let id: String

    /// Sticker
    internal let sticker: Sticker

    internal init(
        id: String,
        sticker: Sticker
    ) {
        self.id = id
        self.sticker = sticker
    }
}

/// Represents a video
internal struct InlineQueryResultVideo: Codable {
    internal let description: String

    /// Unique identifier of the query result
    internal let id: String

    /// Title of the video
    internal let title: String

    /// Video
    internal let video: Video

    internal init(
        description: String,
        id: String,
        title: String,
        video: Video
    ) {
        self.description = description
        self.id = id
        self.title = title
        self.video = video
    }
}

/// Represents a voice note
internal struct InlineQueryResultVoiceNote: Codable {
    /// Unique identifier of the query result
    internal let id: String

    /// Title of the voice note
    internal let title: String

    /// Voice note
    internal let voiceNote: VoiceNote

    internal init(
        id: String,
        title: String,
        voiceNote: VoiceNote
    ) {
        self.id = id
        self.title = title
        self.voiceNote = voiceNote
    }
}
