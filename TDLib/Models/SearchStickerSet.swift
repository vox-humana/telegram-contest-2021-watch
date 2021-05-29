//
//  SearchStickerSet.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for a sticker set by its name
internal struct SearchStickerSet: Codable {
    /// Name of the sticker set
    internal let name: String

    internal init(name: String) {
        self.name = name
    }
}
