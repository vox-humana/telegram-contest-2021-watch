//
//  ReportChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or if this is a private chat with a bot, a private chat with a user sharing their location, a supergroup, or a channel, since other chats can't be checked by moderators
internal struct ReportChat: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Identifiers of reported messages, if any
    internal let messageIds: [Int64]

    /// The reason for reporting the chat
    internal let reason: ChatReportReason

    /// Additional report details; 0-1024 characters
    internal let text: String

    internal init(
        chatId: Int64,
        messageIds: [Int64],
        reason: ChatReportReason,
        text: String
    ) {
        self.chatId = chatId
        self.messageIds = messageIds
        self.reason = reason
        self.text = text
    }
}
