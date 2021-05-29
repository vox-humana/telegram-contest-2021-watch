//
//  ChatStatisticsMessageInteractionInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains statistics about interactions with a message
internal struct ChatStatisticsMessageInteractionInfo: Codable {
    /// Number of times the message was forwarded
    internal let forwardCount: Int

    /// Message identifier
    internal let messageId: Int64

    /// Number of times the message was viewed
    internal let viewCount: Int

    internal init(
        forwardCount: Int,
        messageId: Int64,
        viewCount: Int
    ) {
        self.forwardCount = forwardCount
        self.messageId = messageId
        self.viewCount = viewCount
    }
}
