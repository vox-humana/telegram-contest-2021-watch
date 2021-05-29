//
//  StickerSet.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a sticker set
internal struct StickerSet: Codable {
    /// A list of emoji corresponding to the stickers in the same order. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object
    internal let emojis: [Emojis]

    /// Identifier of the sticker set
    internal let id: TdInt64

    /// True, is the stickers in the set are animated
    internal let isAnimated: Bool

    /// True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
    internal let isArchived: Bool

    /// True, if the sticker set has been installed by the current user
    internal let isInstalled: Bool

    /// True, if the stickers in the set are masks
    internal let isMasks: Bool

    /// True, if the sticker set is official
    internal let isOfficial: Bool

    /// True for already viewed trending sticker sets
    internal let isViewed: Bool

    /// Name of the sticker set
    internal let name: String

    /// List of stickers in this set
    internal let stickers: [Sticker]

    /// Sticker set thumbnail in WEBP or TGS format with width and height 100; may be null. The file can be downloaded only before the thumbnail is changed
    internal let thumbnail: Thumbnail?

    /// Sticker set thumbnail's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
    internal let thumbnailOutline: [ClosedVectorPath]

    /// Title of the sticker set
    internal let title: String

    internal init(
        emojis: [Emojis],
        id: TdInt64,
        isAnimated: Bool,
        isArchived: Bool,
        isInstalled: Bool,
        isMasks: Bool,
        isOfficial: Bool,
        isViewed: Bool,
        name: String,
        stickers: [Sticker],
        thumbnail: Thumbnail?,
        thumbnailOutline: [ClosedVectorPath],
        title: String
    ) {
        self.emojis = emojis
        self.id = id
        self.isAnimated = isAnimated
        self.isArchived = isArchived
        self.isInstalled = isInstalled
        self.isMasks = isMasks
        self.isOfficial = isOfficial
        self.isViewed = isViewed
        self.name = name
        self.stickers = stickers
        self.thumbnail = thumbnail
        self.thumbnailOutline = thumbnailOutline
        self.title = title
    }
}
