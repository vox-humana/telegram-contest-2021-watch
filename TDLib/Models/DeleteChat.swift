//
//  DeleteChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes a chat along with all messages in the corresponding chat for all chat members; requires owner privileges. For group chats this will release the username and remove all members. Chats with more than 1000 members can't be deleted using this method
internal struct DeleteChat: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
