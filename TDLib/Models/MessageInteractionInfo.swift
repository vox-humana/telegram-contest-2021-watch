//
//  MessageInteractionInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about interactions with a message
internal struct MessageInteractionInfo: Codable {
    /// Number of times the message was forwarded
    internal let forwardCount: Int

    /// Contains information about direct or indirect replies to the message; may be null. Currently, available only in channels with a discussion supergroup and discussion supergroups for messages, which are not replies itself
    internal let replyInfo: MessageReplyInfo?

    /// Number of times the message was viewed
    internal let viewCount: Int

    internal init(
        forwardCount: Int,
        replyInfo: MessageReplyInfo?,
        viewCount: Int
    ) {
        self.forwardCount = forwardCount
        self.replyInfo = replyInfo
        self.viewCount = viewCount
    }
}
