//
//  RemoveRecentlyFoundChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes a chat from the list of recently found chats
internal struct RemoveRecentlyFoundChat: Codable {
    /// Identifier of the chat to be removed
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
