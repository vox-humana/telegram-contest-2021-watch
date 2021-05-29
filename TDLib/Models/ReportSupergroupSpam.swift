//
//  ReportSupergroupSpam.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Reports some messages from a user in a supergroup as spam; requires administrator rights in the supergroup
internal struct ReportSupergroupSpam: Codable {
    /// Identifiers of messages sent in the supergroup by the user. This list must be non-empty
    internal let messageIds: [Int64]

    /// Supergroup identifier
    internal let supergroupId: Int

    /// User identifier
    internal let userId: Int

    internal init(
        messageIds: [Int64],
        supergroupId: Int,
        userId: Int
    ) {
        self.messageIds = messageIds
        self.supergroupId = supergroupId
        self.userId = userId
    }
}
