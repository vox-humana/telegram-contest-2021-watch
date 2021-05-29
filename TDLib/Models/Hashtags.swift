//
//  Hashtags.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of hashtags
internal struct Hashtags: Codable {
    /// A list of hashtags
    internal let hashtags: [String]

    internal init(hashtags: [String]) {
        self.hashtags = hashtags
    }
}
