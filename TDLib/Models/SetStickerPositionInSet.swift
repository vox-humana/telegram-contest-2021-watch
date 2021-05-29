//
//  SetStickerPositionInSet.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the position of a sticker in the set to which it belongs; for bots only. The sticker set must have been created by the bot
internal struct SetStickerPositionInSet: Codable {
    /// New position of the sticker in the set, zero-based
    internal let position: Int

    /// Sticker
    internal let sticker: InputFile

    internal init(
        position: Int,
        sticker: InputFile
    ) {
        self.position = position
        self.sticker = sticker
    }
}
