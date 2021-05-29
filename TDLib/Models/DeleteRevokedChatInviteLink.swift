//
//  DeleteRevokedChatInviteLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes revoked chat invite links. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
internal struct DeleteRevokedChatInviteLink: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Invite link to revoke
    internal let inviteLink: String

    internal init(
        chatId: Int64,
        inviteLink: String
    ) {
        self.chatId = chatId
        self.inviteLink = inviteLink
    }
}
