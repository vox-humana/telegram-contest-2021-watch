//
//  GetMessageStatistics.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns detailed statistics about a message. Can be used only if Message.can_get_statistics == true
internal struct GetMessageStatistics: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Pass true if a dark theme is used by the application
    internal let isDark: Bool

    /// Message identifier
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        isDark: Bool,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.isDark = isDark
        self.messageId = messageId
    }
}
