//
//  GetChatListsToAddChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns chat lists to which the chat can be added. This is an offline request
internal struct GetChatListsToAddChat: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
