//
//  DeleteAllRevokedChatInviteLinks.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes all revoked chat invite links created by a given chat administrator. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
internal struct DeleteAllRevokedChatInviteLinks: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner
    internal let creatorUserId: Int

    internal init(
        chatId: Int64,
        creatorUserId: Int
    ) {
        self.chatId = chatId
        self.creatorUserId = creatorUserId
    }
}
