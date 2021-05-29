//
//  ChatStatisticsAdministratorActionsInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains statistics about administrator actions done by a user
internal struct ChatStatisticsAdministratorActionsInfo: Codable {
    /// Number of users banned by the administrator
    internal let bannedUserCount: Int

    /// Number of messages deleted by the administrator
    internal let deletedMessageCount: Int

    /// Number of users restricted by the administrator
    internal let restrictedUserCount: Int

    /// Administrator user identifier
    internal let userId: Int

    internal init(
        bannedUserCount: Int,
        deletedMessageCount: Int,
        restrictedUserCount: Int,
        userId: Int
    ) {
        self.bannedUserCount = bannedUserCount
        self.deletedMessageCount = deletedMessageCount
        self.restrictedUserCount = restrictedUserCount
        self.userId = userId
    }
}
