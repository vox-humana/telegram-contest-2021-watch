//
//  JoinChatByInviteLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Uses an invite link to add the current user to the chat if possible
internal struct JoinChatByInviteLink: Codable {
    /// Invite link to import; must have URL "t.me", "telegram.me", or "telegram.dog" and query beginning with "/joinchat/" or "/+"
    internal let inviteLink: String

    internal init(inviteLink: String) {
        self.inviteLink = inviteLink
    }
}
