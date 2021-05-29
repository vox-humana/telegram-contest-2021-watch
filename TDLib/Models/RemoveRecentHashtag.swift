//
//  RemoveRecentHashtag.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes a hashtag from the list of recently used hashtags
internal struct RemoveRecentHashtag: Codable {
    /// Hashtag to delete
    internal let hashtag: String

    internal init(hashtag: String) {
        self.hashtag = hashtag
    }
}
