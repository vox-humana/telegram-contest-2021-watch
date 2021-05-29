//
//  GetCallbackQueryAnswer.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires
internal struct GetCallbackQueryAnswer: Codable {
    /// Identifier of the chat with the message
    internal let chatId: Int64

    /// Identifier of the message from which the query originated
    internal let messageId: Int64

    /// Query payload
    internal let payload: CallbackQueryPayload

    internal init(
        chatId: Int64,
        messageId: Int64,
        payload: CallbackQueryPayload
    ) {
        self.chatId = chatId
        self.messageId = messageId
        self.payload = payload
    }
}
