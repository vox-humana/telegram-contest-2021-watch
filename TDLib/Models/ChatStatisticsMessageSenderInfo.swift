//
//  ChatStatisticsMessageSenderInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains statistics about messages sent by a user
internal struct ChatStatisticsMessageSenderInfo: Codable {
    /// Average number of characters in sent messages
    internal let averageCharacterCount: Int

    /// Number of sent messages
    internal let sentMessageCount: Int

    /// User identifier
    internal let userId: Int

    internal init(
        averageCharacterCount: Int,
        sentMessageCount: Int,
        userId: Int
    ) {
        self.averageCharacterCount = averageCharacterCount
        self.sentMessageCount = sentMessageCount
        self.userId = userId
    }
}
