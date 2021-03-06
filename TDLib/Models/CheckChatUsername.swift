//
//  CheckChatUsername.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Checks whether a username can be set for a chat
internal struct CheckChatUsername: Codable {
    /// Chat identifier; should be identifier of a supergroup chat, or a channel chat, or a private chat with self, or zero if chat is being created
    internal let chatId: Int64

    /// Username to be checked
    internal let username: String

    internal init(
        chatId: Int64,
        username: String
    ) {
        self.chatId = chatId
        self.username = username
    }
}
