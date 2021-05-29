//
//  RemoveStickerFromSet.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes a sticker from the set to which it belongs; for bots only. The sticker set must have been created by the bot
internal struct RemoveStickerFromSet: Codable {
    /// Sticker
    internal let sticker: InputFile

    internal init(sticker: InputFile) {
        self.sticker = sticker
    }
}
