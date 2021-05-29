//
//  RemoveFavoriteSticker.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes a sticker from the list of favorite stickers
internal struct RemoveFavoriteSticker: Codable {
    /// Sticker file to delete from the list
    internal let sticker: InputFile

    internal init(sticker: InputFile) {
        self.sticker = sticker
    }
}
