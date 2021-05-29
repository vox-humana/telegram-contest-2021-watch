//
//  ReorderChatFilters.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the order of chat filters
internal struct ReorderChatFilters: Codable {
    /// Identifiers of chat filters in the new correct order
    internal let chatFilterIds: [Int]

    internal init(chatFilterIds: [Int]) {
        self.chatFilterIds = chatFilterIds
    }
}
