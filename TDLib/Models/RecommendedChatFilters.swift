//
//  RecommendedChatFilters.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of recommended chat filters
internal struct RecommendedChatFilters: Codable {
    /// List of recommended chat filters
    internal let chatFilters: [RecommendedChatFilter]

    internal init(chatFilters: [RecommendedChatFilter]) {
        self.chatFilters = chatFilters
    }
}
