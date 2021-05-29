//
//  GetChatPinnedMessage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a newest pinned message in the chat
internal struct GetChatPinnedMessage: Codable {
    /// Identifier of the chat the message belongs to
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
