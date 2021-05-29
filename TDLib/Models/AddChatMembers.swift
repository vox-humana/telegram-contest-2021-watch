//
//  AddChatMembers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds multiple new members to a chat. Currently this method is only available for supergroups and channels. This method can't be used to join a chat. Members can't be added to a channel if it has more than 200 members
internal struct AddChatMembers: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels
    internal let userIds: [Int]

    internal init(
        chatId: Int64,
        userIds: [Int]
    ) {
        self.chatId = chatId
        self.userIds = userIds
    }
}
