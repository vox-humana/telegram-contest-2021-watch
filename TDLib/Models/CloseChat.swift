//
//  CloseChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Informs TDLib that the chat is closed by the user. Many useful activities depend on the chat being opened or closed
internal struct CloseChat: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
