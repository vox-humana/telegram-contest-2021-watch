//
//  ReadAllChatMentions.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Marks all mentions in a chat as read
internal struct ReadAllChatMentions: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
