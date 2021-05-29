//
//  GetUser.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a user by their identifier. This is an offline request if the current user is not a bot
internal struct GetUser: Codable {
    /// User identifier
    internal let userId: Int

    internal init(userId: Int) {
        self.userId = userId
    }
}
