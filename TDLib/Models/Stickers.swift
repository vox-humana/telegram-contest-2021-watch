//
//  Stickers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a list of stickers
internal struct Stickers: Codable {
    /// List of stickers
    internal let stickers: [Sticker]

    internal init(stickers: [Sticker]) {
        self.stickers = stickers
    }
}
