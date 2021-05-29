//
//  JoinChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds the current user as a new member to a chat. Private and secret chats can't be joined using this method
internal struct JoinChat: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
