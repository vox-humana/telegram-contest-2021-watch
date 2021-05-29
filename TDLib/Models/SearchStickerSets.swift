//
//  SearchStickerSets.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for ordinary sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results
internal struct SearchStickerSets: Codable {
    /// Query to search for
    internal let query: String

    internal init(query: String) {
        self.query = query
    }
}
