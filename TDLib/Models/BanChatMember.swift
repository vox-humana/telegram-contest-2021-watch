//
//  BanChatMember.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Bans a member in a chat. Members can't be banned in private or secret chats. In supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first
internal struct BanChatMember: Codable {
    /// Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups
    internal let bannedUntilDate: Int

    /// Chat identifier
    internal let chatId: Int64

    /// Member identifier
    internal let memberId: MessageSender

    /// Pass true to delete all messages in the chat for the user. Always true for supergroups and channels
    internal let revokeMessages: Bool

    internal init(
        bannedUntilDate: Int,
        chatId: Int64,
        memberId: MessageSender,
        revokeMessages: Bool
    ) {
        self.bannedUntilDate = bannedUntilDate
        self.chatId = chatId
        self.memberId = memberId
        self.revokeMessages = revokeMessages
    }
}
