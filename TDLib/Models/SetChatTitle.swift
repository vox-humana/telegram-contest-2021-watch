//
//  SetChatTitle.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_change_info administrator right
internal struct SetChatTitle: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New title of the chat; 1-128 characters
    internal let title: String

    internal init(
        chatId: Int64,
        title: String
    ) {
        self.chatId = chatId
        self.title = title
    }
}
