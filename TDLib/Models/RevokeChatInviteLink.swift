//
//  RevokeChatInviteLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Revokes invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links. If a primary link is revoked, then additionally to the revoked link returns new primary link
internal struct RevokeChatInviteLink: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Invite link to be revoked
    internal let inviteLink: String

    internal init(
        chatId: Int64,
        inviteLink: String
    ) {
        self.chatId = chatId
        self.inviteLink = inviteLink
    }
}
