//
//  FoundMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of messages found by a search
internal struct FoundMessages: Codable {
    /// List of messages
    internal let messages: [Message]

    /// The offset for the next request. If empty, there are no more results
    internal let nextOffset: String

    /// Approximate total count of messages found; -1 if unknown
    internal let totalCount: Int

    internal init(
        messages: [Message],
        nextOffset: String,
        totalCount: Int
    ) {
        self.messages = messages
        self.nextOffset = nextOffset
        self.totalCount = totalCount
    }
}
