//
//  GetChatInviteLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about an invite link. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links
internal struct GetChatInviteLink: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Invite link to get
    internal let inviteLink: String

    internal init(
        chatId: Int64,
        inviteLink: String
    ) {
        self.chatId = chatId
        self.inviteLink = inviteLink
    }
}
