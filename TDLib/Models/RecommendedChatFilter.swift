//
//  RecommendedChatFilter.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a recommended chat filter
internal struct RecommendedChatFilter: Codable {
    internal let description: String

    /// The chat filter
    internal let filter: ChatFilter

    internal init(
        description: String,
        filter: ChatFilter
    ) {
        self.description = description
        self.filter = filter
    }
}
