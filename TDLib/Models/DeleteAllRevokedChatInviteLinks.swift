//
//  DeleteAllRevokedChatInviteLinks.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes all revoked chat invite links created by a given chat administrator. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
public struct DeleteAllRevokedChatInviteLinks: Codable {
    /// Chat identifier
    public let chatId: Int64

    /// User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner
    public let creatorUserId: Int

    public init(
        chatId: Int64,
        creatorUserId: Int
    ) {
        self.chatId = chatId
        self.creatorUserId = creatorUserId
    }
}
