//
//  ChatInviteLinkCount.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a chat administrator with a number of active and revoked chat invite links
internal struct ChatInviteLinkCount: Codable {
    /// Number of active invite links
    internal let inviteLinkCount: Int

    /// Number of revoked invite links
    internal let revokedInviteLinkCount: Int

    /// Administrator's user identifier
    internal let userId: Int

    internal init(
        inviteLinkCount: Int,
        revokedInviteLinkCount: Int,
        userId: Int
    ) {
        self.inviteLinkCount = inviteLinkCount
        self.revokedInviteLinkCount = revokedInviteLinkCount
        self.userId = userId
    }
}
