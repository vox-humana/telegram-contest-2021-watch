//
//  SearchChatRecentLocationMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user
internal struct SearchChatRecentLocationMessages: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The maximum number of messages to be returned
    internal let limit: Int

    internal init(
        chatId: Int64,
        limit: Int
    ) {
        self.chatId = chatId
        self.limit = limit
    }
}
