//
//  Users.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a list of users
internal struct Users: Codable {
    /// Approximate total count of users found
    internal let totalCount: Int

    /// A list of user identifiers
    internal let userIds: [Int]

    internal init(
        totalCount: Int,
        userIds: [Int]
    ) {
        self.totalCount = totalCount
        self.userIds = userIds
    }
}
