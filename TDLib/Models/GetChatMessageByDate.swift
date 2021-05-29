//
//  GetChatMessageByDate.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the last message sent in a chat no later than the specified date
internal struct GetChatMessageByDate: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Point in time (Unix timestamp) relative to which to search for messages
    internal let date: Int

    internal init(
        chatId: Int64,
        date: Int
    ) {
        self.chatId = chatId
        self.date = date
    }
}
