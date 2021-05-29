//
//  AddChatMember.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds a new member to a chat. Members can't be added to private or secret chats
internal struct AddChatMember: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels
    internal let forwardLimit: Int

    /// Identifier of the user
    internal let userId: Int

    internal init(
        chatId: Int64,
        forwardLimit: Int,
        userId: Int
    ) {
        self.chatId = chatId
        self.forwardLimit = forwardLimit
        self.userId = userId
    }
}
