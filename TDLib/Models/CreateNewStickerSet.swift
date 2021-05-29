//
//  CreateNewStickerSet.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Creates a new sticker set; for bots only. Returns the newly created sticker set
internal struct CreateNewStickerSet: Codable {
    /// True, if stickers are masks. Animated stickers can't be masks
    internal let isMasks: Bool

    /// Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive); 1-64 characters
    internal let name: String

    /// List of stickers to be added to the set; must be non-empty. All stickers must be of the same type
    internal let stickers: [InputSticker]

    /// Sticker set title; 1-64 characters
    internal let title: String

    /// Sticker set owner
    internal let userId: Int

    internal init(
        isMasks: Bool,
        name: String,
        stickers: [InputSticker],
        title: String,
        userId: Int
    ) {
        self.isMasks = isMasks
        self.name = name
        self.stickers = stickers
        self.title = title
        self.userId = userId
    }
}
