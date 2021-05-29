//
//  StickerSets.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a list of sticker sets
internal struct StickerSets: Codable {
    /// List of sticker sets
    internal let sets: [StickerSetInfo]

    /// Approximate total number of sticker sets found
    internal let totalCount: Int

    internal init(
        sets: [StickerSetInfo],
        totalCount: Int
    ) {
        self.sets = sets
        self.totalCount = totalCount
    }
}
