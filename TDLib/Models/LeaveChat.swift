//
//  LeaveChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes the current user from chat members. Private and secret chats can't be left using this method
internal struct LeaveChat: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
