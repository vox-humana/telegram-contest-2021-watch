//
//  ChatInviteLinks.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of chat invite links
internal struct ChatInviteLinks: Codable {
    /// List of invite links
    internal let inviteLinks: [ChatInviteLink]

    /// Approximate total count of chat invite links found
    internal let totalCount: Int

    internal init(
        inviteLinks: [ChatInviteLink],
        totalCount: Int
    ) {
        self.inviteLinks = inviteLinks
        self.totalCount = totalCount
    }
}
