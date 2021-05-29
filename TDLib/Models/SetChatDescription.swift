//
//  SetChatDescription.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes information about a chat. Available for basic groups, supergroups, and channels. Requires can_change_info administrator right
internal struct SetChatDescription: Codable {
    /// Identifier of the chat
    internal let chatId: Int64

    internal let description: String

    internal init(
        chatId: Int64,
        description: String
    ) {
        self.chatId = chatId
        self.description = description
    }
}
