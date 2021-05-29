//
//  ChatInviteLinkCounts.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of chat invite link counts
internal struct ChatInviteLinkCounts: Codable {
    /// List of invite linkcounts
    internal let inviteLinkCounts: [ChatInviteLinkCount]

    internal init(inviteLinkCounts: [ChatInviteLinkCount]) {
        self.inviteLinkCounts = inviteLinkCounts
    }
}
