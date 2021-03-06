//
//  InputChatPhoto.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a photo to be set as a user profile or chat photo
internal enum InputChatPhoto: Codable {
    /// A previously used profile photo of the current user
    case inputChatPhotoPrevious(InputChatPhotoPrevious)

    /// A static photo in JPEG format
    case inputChatPhotoStatic(InputChatPhotoStatic)

    /// An animation in MPEG4 format; must be square, at most 10 seconds long, have width between 160 and 800 and be at most 2MB in size
    case inputChatPhotoAnimation(InputChatPhotoAnimation)

    private enum Kind: String, Codable {
        case inputChatPhotoPrevious
        case inputChatPhotoStatic
        case inputChatPhotoAnimation
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .inputChatPhotoPrevious:
            let value = try InputChatPhotoPrevious(from: decoder)
            self = .inputChatPhotoPrevious(value)
        case .inputChatPhotoStatic:
            let value = try InputChatPhotoStatic(from: decoder)
            self = .inputChatPhotoStatic(value)
        case .inputChatPhotoAnimation:
            let value = try InputChatPhotoAnimation(from: decoder)
            self = .inputChatPhotoAnimation(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .inputChatPhotoPrevious(value):
            try container.encode(Kind.inputChatPhotoPrevious, forKey: .type)
            try value.encode(to: encoder)
        case let .inputChatPhotoStatic(value):
            try container.encode(Kind.inputChatPhotoStatic, forKey: .type)
            try value.encode(to: encoder)
        case let .inputChatPhotoAnimation(value):
            try container.encode(Kind.inputChatPhotoAnimation, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A previously used profile photo of the current user
internal struct InputChatPhotoPrevious: Codable {
    /// Identifier of the current user's profile photo to reuse
    internal let chatPhotoId: TdInt64

    internal init(chatPhotoId: TdInt64) {
        self.chatPhotoId = chatPhotoId
    }
}

/// A static photo in JPEG format
internal struct InputChatPhotoStatic: Codable {
    /// Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
    internal let photo: InputFile

    internal init(photo: InputFile) {
        self.photo = photo
    }
}

/// An animation in MPEG4 format; must be square, at most 10 seconds long, have width between 160 and 800 and be at most 2MB in size
internal struct InputChatPhotoAnimation: Codable {
    /// Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
    internal let animation: InputFile

    /// Timestamp of the frame, which will be used as static chat photo
    internal let mainFrameTimestamp: Double

    internal init(
        animation: InputFile,
        mainFrameTimestamp: Double
    ) {
        self.animation = animation
        self.mainFrameTimestamp = mainFrameTimestamp
    }
}
