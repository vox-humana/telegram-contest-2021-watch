//
//  AddRecentlyFoundChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If the chat is already in the list, it will be removed from the list first
internal struct AddRecentlyFoundChat: Codable {
    /// Identifier of the chat to add
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
