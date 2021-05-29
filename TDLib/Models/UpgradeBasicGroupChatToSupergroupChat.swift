//
//  UpgradeBasicGroupChatToSupergroupChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Creates a new supergroup from an existing basic group and sends a corresponding messageChatUpgradeTo and messageChatUpgradeFrom; requires creator privileges. Deactivates the original basic group
internal struct UpgradeBasicGroupChatToSupergroupChat: Codable {
    /// Identifier of the chat to upgrade
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
