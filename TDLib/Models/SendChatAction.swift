//
//  SendChatAction.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends a notification about user activity in a chat
internal struct SendChatAction: Codable {
    /// The action description
    internal let action: ChatAction

    /// Chat identifier
    internal let chatId: Int64

    /// If not 0, a message thread identifier in which the action was performed
    internal let messageThreadId: Int64

    internal init(
        action: ChatAction,
        chatId: Int64,
        messageThreadId: Int64
    ) {
        self.action = action
        self.chatId = chatId
        self.messageThreadId = messageThreadId
    }
}
