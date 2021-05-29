//
//  GetChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a chat by its identifier, this is an offline request if the current user is not a bot
internal struct GetChat: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
