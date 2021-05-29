//
//  AddChatToList.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed
internal struct AddChatToList: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The chat list. Use getChatListsToAddChat to get suitable chat lists
    internal let chatList: ChatList

    internal init(
        chatId: Int64,
        chatList: ChatList
    ) {
        self.chatId = chatId
        self.chatList = chatList
    }
}
