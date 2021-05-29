//
//  SearchHashtags.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for recently used hashtags by their prefix
internal struct SearchHashtags: Codable {
    /// The maximum number of hashtags to be returned
    internal let limit: Int

    /// Hashtag prefix to search for
    internal let prefix: String

    internal init(
        limit: Int,
        prefix: String
    ) {
        self.limit = limit
        self.prefix = prefix
    }
}
