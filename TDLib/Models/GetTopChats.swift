//
//  GetTopChats.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a list of frequently used chats. Supported only if the chat info database is enabled
internal struct GetTopChats: Codable {
    /// Category of chats to be returned
    internal let category: TopChatCategory

    /// The maximum number of chats to be returned; up to 30
    internal let limit: Int

    internal init(
        category: TopChatCategory,
        limit: Int
    ) {
        self.category = category
        self.limit = limit
    }
}
