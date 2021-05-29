//
//  Chats.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a list of chats
internal struct Chats: Codable {
    /// List of chat identifiers
    internal let chatIds: [Int64]

    /// Approximate total count of chats found
    internal let totalCount: Int

    internal init(
        chatIds: [Int64],
        totalCount: Int
    ) {
        self.chatIds = chatIds
        self.totalCount = totalCount
    }
}
