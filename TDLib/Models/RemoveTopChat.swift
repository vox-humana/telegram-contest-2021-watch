//
//  RemoveTopChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled
internal struct RemoveTopChat: Codable {
    /// Category of frequently used chats
    internal let category: TopChatCategory

    /// Chat identifier
    internal let chatId: Int64

    internal init(
        category: TopChatCategory,
        chatId: Int64
    ) {
        self.category = category
        self.chatId = chatId
    }
}
