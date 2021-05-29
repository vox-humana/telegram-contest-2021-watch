//
//  SendChatScreenshotTakenNotification.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends a notification about a screenshot taken in a chat. Supported only in private and secret chats
internal struct SendChatScreenshotTakenNotification: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
