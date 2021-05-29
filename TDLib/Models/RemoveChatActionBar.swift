//
//  RemoveChatActionBar.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes a chat action bar without any other action
internal struct RemoveChatActionBar: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
