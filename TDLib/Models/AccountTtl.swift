//
//  AccountTtl.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about the period of inactivity after which the current user's account will automatically be deleted
internal struct AccountTtl: Codable {
    /// Number of days of inactivity before the account will be flagged for deletion; should range from 30-366 days
    internal let days: Int

    internal init(days: Int) {
        self.days = days
    }
}
