//
//  ChatStatisticsInviterInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains statistics about number of new members invited by a user
internal struct ChatStatisticsInviterInfo: Codable {
    /// Number of new members invited by the user
    internal let addedMemberCount: Int

    /// User identifier
    internal let userId: Int

    internal init(
        addedMemberCount: Int,
        userId: Int
    ) {
        self.addedMemberCount = addedMemberCount
        self.userId = userId
    }
}
