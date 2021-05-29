//
//  SetPinnedChats.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the order of pinned chats
internal struct SetPinnedChats: Codable {
    /// The new list of pinned chats
    internal let chatIds: [Int64]

    /// Chat list in which to change the order of pinned chats
    internal let chatList: ChatList

    internal init(
        chatIds: [Int64],
        chatList: ChatList
    ) {
        self.chatIds = chatIds
        self.chatList = chatList
    }
}
