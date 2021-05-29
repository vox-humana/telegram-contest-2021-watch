//
//  ChatInviteLinkMember.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a chat member joined a chat by an invite link
internal struct ChatInviteLinkMember: Codable {
    /// Point in time (Unix timestamp) when the user joined the chat
    internal let joinedChatDate: Int

    /// User identifier
    internal let userId: Int

    internal init(
        joinedChatDate: Int,
        userId: Int
    ) {
        self.joinedChatDate = joinedChatDate
        self.userId = userId
    }
}
