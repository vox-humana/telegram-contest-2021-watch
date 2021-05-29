//
//  SendInlineQueryResultMessage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message
internal struct SendInlineQueryResultMessage: Codable {
    /// Target chat
    internal let chatId: Int64

    /// If true, there will be no mention of a bot, via which the message is sent. Can be used only for bots GetOption("animation_search_bot_username"), GetOption("photo_search_bot_username") and GetOption("venue_search_bot_username")
    internal let hideViaBot: Bool

    /// If not 0, a message thread identifier in which the message will be sent
    internal let messageThreadId: Int64

    /// Options to be used to send the message
    internal let options: MessageSendOptions

    /// Identifier of the inline query
    internal let queryId: TdInt64

    /// Identifier of a message to reply to or 0
    internal let replyToMessageId: Int64

    /// Identifier of the inline result
    internal let resultId: String

    internal init(
        chatId: Int64,
        hideViaBot: Bool,
        messageThreadId: Int64,
        options: MessageSendOptions,
        queryId: TdInt64,
        replyToMessageId: Int64,
        resultId: String
    ) {
        self.chatId = chatId
        self.hideViaBot = hideViaBot
        self.messageThreadId = messageThreadId
        self.options = options
        self.queryId = queryId
        self.replyToMessageId = replyToMessageId
        self.resultId = resultId
    }
}
