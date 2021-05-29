//
//  MessageSenders.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a list of message senders
internal struct MessageSenders: Codable {
    /// List of message senders
    internal let senders: [MessageSender]

    /// Approximate total count of messages senders found
    internal let totalCount: Int

    internal init(
        senders: [MessageSender],
        totalCount: Int
    ) {
        self.senders = senders
        self.totalCount = totalCount
    }
}
