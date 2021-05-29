//
//  SearchStickers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for stickers from public sticker sets that correspond to a given emoji
internal struct SearchStickers: Codable {
    /// String representation of emoji; must be non-empty
    internal let emoji: String

    /// The maximum number of stickers to be returned
    internal let limit: Int

    internal init(
        emoji: String,
        limit: Int
    ) {
        self.emoji = emoji
        self.limit = limit
    }
}
