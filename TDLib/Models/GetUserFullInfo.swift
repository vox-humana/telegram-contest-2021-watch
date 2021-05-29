//
//  GetUserFullInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns full information about a user by their identifier
internal struct GetUserFullInfo: Codable {
    /// User identifier
    internal let userId: Int

    internal init(userId: Int) {
        self.userId = userId
    }
}
