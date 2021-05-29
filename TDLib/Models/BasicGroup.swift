//
//  BasicGroup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a basic group of 0-200 users (must be upgraded to a supergroup to accommodate more than 200 users)
internal struct BasicGroup: Codable {
    /// Group identifier
    internal let id: Int

    /// True, if the group is active
    internal let isActive: Bool

    /// Number of members in the group
    internal let memberCount: Int

    /// Status of the current user in the group
    internal let status: ChatMemberStatus

    /// Identifier of the supergroup to which this group was upgraded; 0 if none
    internal let upgradedToSupergroupId: Int

    internal init(
        id: Int,
        isActive: Bool,
        memberCount: Int,
        status: ChatMemberStatus,
        upgradedToSupergroupId: Int
    ) {
        self.id = id
        self.isActive = isActive
        self.memberCount = memberCount
        self.status = status
        self.upgradedToSupergroupId = upgradedToSupergroupId
    }
}
