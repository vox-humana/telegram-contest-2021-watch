//
//  GetChatInviteLinkCounts.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns list of chat administrators with number of their invite links. Requires owner privileges in the chat
internal struct GetChatInviteLinkCounts: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
