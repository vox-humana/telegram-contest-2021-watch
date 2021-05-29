//
//  DeleteChatMessagesFromUser.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes all messages sent by the specified user to a chat. Supported only for supergroups; requires can_delete_messages administrator privileges
internal struct DeleteChatMessagesFromUser: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// User identifier
    internal let userId: Int

    internal init(
        chatId: Int64,
        userId: Int
    ) {
        self.chatId = chatId
        self.userId = userId
    }
}
