//
//  CreateChatInviteLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Creates a new invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat
internal struct CreateChatInviteLink: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Point in time (Unix timestamp) when the link will expire; pass 0 if never
    internal let expireDate: Int

    /// The maximum number of chat members that can join the chat by the link simultaneously; 0-99999; pass 0 if not limited
    internal let memberLimit: Int

    internal init(
        chatId: Int64,
        expireDate: Int,
        memberLimit: Int
    ) {
        self.chatId = chatId
        self.expireDate = expireDate
        self.memberLimit = memberLimit
    }
}
