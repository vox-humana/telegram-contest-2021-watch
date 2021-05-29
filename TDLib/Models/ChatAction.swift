//
//  ChatAction.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes the different types of activity in a chat
internal enum ChatAction: Codable {
    /// The user is typing a message
    case chatActionTyping

    /// The user is recording a video
    case chatActionRecordingVideo

    /// The user is uploading a video
    case chatActionUploadingVideo(ChatActionUploadingVideo)

    /// The user is recording a voice note
    case chatActionRecordingVoiceNote

    /// The user is uploading a voice note
    case chatActionUploadingVoiceNote(ChatActionUploadingVoiceNote)

    /// The user is uploading a photo
    case chatActionUploadingPhoto(ChatActionUploadingPhoto)

    /// The user is uploading a document
    case chatActionUploadingDocument(ChatActionUploadingDocument)

    /// The user is picking a location or venue to send
    case chatActionChoosingLocation

    /// The user is picking a contact to send
    case chatActionChoosingContact

    /// The user has started to play a game
    case chatActionStartPlayingGame

    /// The user is recording a video note
    case chatActionRecordingVideoNote

    /// The user is uploading a video note
    case chatActionUploadingVideoNote(ChatActionUploadingVideoNote)

    /// The user has cancelled the previous action
    case chatActionCancel

    private enum Kind: String, Codable {
        case chatActionTyping
        case chatActionRecordingVideo
        case chatActionUploadingVideo
        case chatActionRecordingVoiceNote
        case chatActionUploadingVoiceNote
        case chatActionUploadingPhoto
        case chatActionUploadingDocument
        case chatActionChoosingLocation
        case chatActionChoosingContact
        case chatActionStartPlayingGame
        case chatActionRecordingVideoNote
        case chatActionUploadingVideoNote
        case chatActionCancel
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .chatActionTyping:
            self = .chatActionTyping
        case .chatActionRecordingVideo:
            self = .chatActionRecordingVideo
        case .chatActionUploadingVideo:
            let value = try ChatActionUploadingVideo(from: decoder)
            self = .chatActionUploadingVideo(value)
        case .chatActionRecordingVoiceNote:
            self = .chatActionRecordingVoiceNote
        case .chatActionUploadingVoiceNote:
            let value = try ChatActionUploadingVoiceNote(from: decoder)
            self = .chatActionUploadingVoiceNote(value)
        case .chatActionUploadingPhoto:
            let value = try ChatActionUploadingPhoto(from: decoder)
            self = .chatActionUploadingPhoto(value)
        case .chatActionUploadingDocument:
            let value = try ChatActionUploadingDocument(from: decoder)
            self = .chatActionUploadingDocument(value)
        case .chatActionChoosingLocation:
            self = .chatActionChoosingLocation
        case .chatActionChoosingContact:
            self = .chatActionChoosingContact
        case .chatActionStartPlayingGame:
            self = .chatActionStartPlayingGame
        case .chatActionRecordingVideoNote:
            self = .chatActionRecordingVideoNote
        case .chatActionUploadingVideoNote:
            let value = try ChatActionUploadingVideoNote(from: decoder)
            self = .chatActionUploadingVideoNote(value)
        case .chatActionCancel:
            self = .chatActionCancel
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .chatActionTyping:
            try container.encode(Kind.chatActionTyping, forKey: .type)
        case .chatActionRecordingVideo:
            try container.encode(Kind.chatActionRecordingVideo, forKey: .type)
        case let .chatActionUploadingVideo(value):
            try container.encode(Kind.chatActionUploadingVideo, forKey: .type)
            try value.encode(to: encoder)
        case .chatActionRecordingVoiceNote:
            try container.encode(Kind.chatActionRecordingVoiceNote, forKey: .type)
        case let .chatActionUploadingVoiceNote(value):
            try container.encode(Kind.chatActionUploadingVoiceNote, forKey: .type)
            try value.encode(to: encoder)
        case let .chatActionUploadingPhoto(value):
            try container.encode(Kind.chatActionUploadingPhoto, forKey: .type)
            try value.encode(to: encoder)
        case let .chatActionUploadingDocument(value):
            try container.encode(Kind.chatActionUploadingDocument, forKey: .type)
            try value.encode(to: encoder)
        case .chatActionChoosingLocation:
            try container.encode(Kind.chatActionChoosingLocation, forKey: .type)
        case .chatActionChoosingContact:
            try container.encode(Kind.chatActionChoosingContact, forKey: .type)
        case .chatActionStartPlayingGame:
            try container.encode(Kind.chatActionStartPlayingGame, forKey: .type)
        case .chatActionRecordingVideoNote:
            try container.encode(Kind.chatActionRecordingVideoNote, forKey: .type)
        case let .chatActionUploadingVideoNote(value):
            try container.encode(Kind.chatActionUploadingVideoNote, forKey: .type)
            try value.encode(to: encoder)
        case .chatActionCancel:
            try container.encode(Kind.chatActionCancel, forKey: .type)
        }
    }
}

/// The user is uploading a video
internal struct ChatActionUploadingVideo: Codable {
    /// Upload progress, as a percentage
    internal let progress: Int

    internal init(progress: Int) {
        self.progress = progress
    }
}

/// The user is uploading a voice note
internal struct ChatActionUploadingVoiceNote: Codable {
    /// Upload progress, as a percentage
    internal let progress: Int

    internal init(progress: Int) {
        self.progress = progress
    }
}

/// The user is uploading a photo
internal struct ChatActionUploadingPhoto: Codable {
    /// Upload progress, as a percentage
    internal let progress: Int

    internal init(progress: Int) {
        self.progress = progress
    }
}

/// The user is uploading a document
internal struct ChatActionUploadingDocument: Codable {
    /// Upload progress, as a percentage
    internal let progress: Int

    internal init(progress: Int) {
        self.progress = progress
    }
}

/// The user is uploading a video note
internal struct ChatActionUploadingVideoNote: Codable {
    /// Upload progress, as a percentage
    internal let progress: Int

    internal init(progress: Int) {
        self.progress = progress
    }
}
