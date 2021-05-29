//
//  DisconnectWebsite.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Disconnects website from the current user's Telegram account
internal struct DisconnectWebsite: Codable {
    /// Website identifier
    internal let websiteId: TdInt64

    internal init(websiteId: TdInt64) {
        self.websiteId = websiteId
    }
}
