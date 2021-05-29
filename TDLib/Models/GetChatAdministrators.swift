//
//  GetChatAdministrators.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a list of administrators of the chat with their custom titles
internal struct GetChatAdministrators: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
