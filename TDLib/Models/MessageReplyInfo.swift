//
//  MessageReplyInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about replies to a message
internal struct MessageReplyInfo: Codable {
    /// Identifier of the last reply to the message
    internal let lastMessageId: Int64

    /// Identifier of the last read incoming reply to the message
    internal let lastReadInboxMessageId: Int64

    /// Identifier of the last read outgoing reply to the message
    internal let lastReadOutboxMessageId: Int64

    /// Recent repliers to the message; available in channels with a discussion supergroup
    internal let recentRepliers: [MessageSender]

    /// Number of times the message was directly or indirectly replied
    internal let replyCount: Int

    internal init(
        lastMessageId: Int64,
        lastReadInboxMessageId: Int64,
        lastReadOutboxMessageId: Int64,
        recentRepliers: [MessageSender],
        replyCount: Int
    ) {
        self.lastMessageId = lastMessageId
        self.lastReadInboxMessageId = lastReadInboxMessageId
        self.lastReadOutboxMessageId = lastReadOutboxMessageId
        self.recentRepliers = recentRepliers
        self.replyCount = replyCount
    }
}
