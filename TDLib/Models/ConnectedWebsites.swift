//
//  ConnectedWebsites.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of websites the current user is logged in with Telegram
internal struct ConnectedWebsites: Codable {
    /// List of connected websites
    internal let websites: [ConnectedWebsite]

    internal init(websites: [ConnectedWebsite]) {
        self.websites = websites
    }
}
