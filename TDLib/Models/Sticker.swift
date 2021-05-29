//
//  Sticker.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a sticker
internal struct Sticker: Codable {
    /// Emoji corresponding to the sticker
    internal let emoji: String

    /// Sticker height; as defined by the sender
    internal let height: Int

    /// True, if the sticker is an animated sticker in TGS format
    internal let isAnimated: Bool

    /// True, if the sticker is a mask
    internal let isMask: Bool

    /// Position where the mask should be placed; may be null
    internal let maskPosition: MaskPosition?

    /// Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
    internal let outline: [ClosedVectorPath]

    /// The identifier of the sticker set to which the sticker belongs; 0 if none
    internal let setId: TdInt64

    /// File containing the sticker
    internal let sticker: File

    /// Sticker thumbnail in WEBP or JPEG format; may be null
    internal let thumbnail: Thumbnail?

    /// Sticker width; as defined by the sender
    internal let width: Int

    internal init(
        emoji: String,
        height: Int,
        isAnimated: Bool,
        isMask: Bool,
        maskPosition: MaskPosition?,
        outline: [ClosedVectorPath],
        setId: TdInt64,
        sticker: File,
        thumbnail: Thumbnail?,
        width: Int
    ) {
        self.emoji = emoji
        self.height = height
        self.isAnimated = isAnimated
        self.isMask = isMask
        self.maskPosition = maskPosition
        self.outline = outline
        self.setId = setId
        self.sticker = sticker
        self.thumbnail = thumbnail
        self.width = width
    }
}
