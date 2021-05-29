//
//  GetStickers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is not empty, favorite and recently used stickers may also be returned
internal struct GetStickers: Codable {
    /// String representation of emoji. If empty, returns all known installed stickers
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
