//
//  GetBlockedMessageSenders.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns users and chats that were blocked by the current user
internal struct GetBlockedMessageSenders: Codable {
    /// The maximum number of users and chats to return; up to 100
    internal let limit: Int

    /// Number of users and chats to skip in the result; must be non-negative
    internal let offset: Int

    internal init(
        limit: Int,
        offset: Int
    ) {
        self.limit = limit
        self.offset = offset
    }
}
