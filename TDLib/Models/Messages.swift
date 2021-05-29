//
//  Messages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of messages
internal struct Messages: Codable {
    /// List of messages; messages may be null
    internal let messages: [Message]?

    /// Approximate total count of messages found
    internal let totalCount: Int

    internal init(
        messages: [Message]?,
        totalCount: Int
    ) {
        self.messages = messages
        self.totalCount = totalCount
    }
}
