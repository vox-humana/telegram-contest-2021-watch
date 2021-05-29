//
//  DeleteMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes messages
internal struct DeleteMessages: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Identifiers of the messages to be deleted
    internal let messageIds: [Int64]

    /// Pass true to try to delete messages for all chat members. Always true for supergroups, channels and secret chats
    internal let revoke: Bool

    internal init(
        chatId: Int64,
        messageIds: [Int64],
        revoke: Bool
    ) {
        self.chatId = chatId
        self.messageIds = messageIds
        self.revoke = revoke
    }
}
