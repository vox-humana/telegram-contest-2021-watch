//
//  InputSticker.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a sticker that needs to be added to a sticker set
internal enum InputSticker: Codable {
    /// A static sticker in PNG format, which will be converted to WEBP server-side
    case inputStickerStatic(InputStickerStatic)

    /// An animated sticker in TGS format
    case inputStickerAnimated(InputStickerAnimated)

    private enum Kind: String, Codable {
        case inputStickerStatic
        case inputStickerAnimated
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .inputStickerStatic:
            let value = try InputStickerStatic(from: decoder)
            self = .inputStickerStatic(value)
        case .inputStickerAnimated:
            let value = try InputStickerAnimated(from: decoder)
            self = .inputStickerAnimated(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .inputStickerStatic(value):
            try container.encode(Kind.inputStickerStatic, forKey: .type)
            try value.encode(to: encoder)
        case let .inputStickerAnimated(value):
            try container.encode(Kind.inputStickerAnimated, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A static sticker in PNG format, which will be converted to WEBP server-side
internal struct InputStickerStatic: Codable {
    /// Emojis corresponding to the sticker
    internal let emojis: String

    /// For masks, position where the mask should be placed; may be null
    internal let maskPosition: MaskPosition?

    /// PNG image with the sticker; must be up to 512 KB in size and fit in a 512x512 square
    internal let sticker: InputFile

    internal init(
        emojis: String,
        maskPosition: MaskPosition?,
        sticker: InputFile
    ) {
        self.emojis = emojis
        self.maskPosition = maskPosition
        self.sticker = sticker
    }
}

/// An animated sticker in TGS format
internal struct InputStickerAnimated: Codable {
    /// Emojis corresponding to the sticker
    internal let emojis: String

    /// File with the animated sticker. Only local or uploaded within a week files are supported. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
    internal let sticker: InputFile

    internal init(
        emojis: String,
        sticker: InputFile
    ) {
        self.emojis = emojis
        self.sticker = sticker
    }
}
