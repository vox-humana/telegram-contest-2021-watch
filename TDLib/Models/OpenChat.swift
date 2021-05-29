//
//  OpenChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Informs TDLib that the chat is opened by the user. Many useful activities depend on the chat being opened or closed (e.g., in supergroups and channels all updates are received only for opened chats)
internal struct OpenChat: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
