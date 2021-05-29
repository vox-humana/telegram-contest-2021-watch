//
//  SearchInstalledStickerSets.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for installed sticker sets by looking for specified query in their title and name
internal struct SearchInstalledStickerSets: Codable {
    /// Pass true to return mask sticker sets; pass false to return ordinary sticker sets
    internal let isMasks: Bool

    /// The maximum number of sticker sets to return
    internal let limit: Int

    /// Query to search for
    internal let query: String

    internal init(
        isMasks: Bool,
        limit: Int,
        query: String
    ) {
        self.isMasks = isMasks
        self.limit = limit
        self.query = query
    }
}
