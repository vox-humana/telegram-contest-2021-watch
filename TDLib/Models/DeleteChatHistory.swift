//
//  DeleteChatHistory.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes all messages in the chat. Use Chat.can_be_deleted_only_for_self and Chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat
internal struct DeleteChatHistory: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Pass true if the chat should be removed from the chat list
    internal let removeFromChatList: Bool

    /// Pass true to try to delete chat history for all users
    internal let revoke: Bool

    internal init(
        chatId: Int64,
        removeFromChatList: Bool,
        revoke: Bool
    ) {
        self.chatId = chatId
        self.removeFromChatList = removeFromChatList
        self.revoke = revoke
    }
}
