//
//  GetChatInviteLinkMembers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns chat members joined a chat by an invite link. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
internal struct GetChatInviteLinkMembers: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Invite link for which to return chat members
    internal let inviteLink: String

    /// The maximum number of chat members to return
    internal let limit: Int

    /// A chat member from which to return next chat members; use null to get results from the beginning
    internal let offsetMember: ChatInviteLinkMember

    internal init(
        chatId: Int64,
        inviteLink: String,
        limit: Int,
        offsetMember: ChatInviteLinkMember
    ) {
        self.chatId = chatId
        self.inviteLink = inviteLink
        self.limit = limit
        self.offsetMember = offsetMember
    }
}
