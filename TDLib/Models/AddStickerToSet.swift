//
//  AddStickerToSet.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds a new sticker to a set; for bots only. Returns the sticker set
internal struct AddStickerToSet: Codable {
    /// Sticker set name
    internal let name: String

    /// Sticker to add to the set
    internal let sticker: InputSticker

    /// Sticker set owner
    internal let userId: Int

    internal init(
        name: String,
        sticker: InputSticker,
        userId: Int
    ) {
        self.name = name
        self.sticker = sticker
        self.userId = userId
    }
}
