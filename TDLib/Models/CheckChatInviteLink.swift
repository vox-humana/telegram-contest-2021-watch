//
//  CheckChatInviteLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Checks the validity of an invite link for a chat and returns information about the corresponding chat
internal struct CheckChatInviteLink: Codable {
    /// Invite link to be checked; must have URL "t.me", "telegram.me", or "telegram.dog" and query beginning with "/joinchat/" or "/+"
    internal let inviteLink: String

    internal init(inviteLink: String) {
        self.inviteLink = inviteLink
    }
}
