//
//  GetChatScheduledMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns all scheduled messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id)
internal struct GetChatScheduledMessages: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
