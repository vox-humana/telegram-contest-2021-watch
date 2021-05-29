//
//  GetCallbackQueryMessage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a message with the callback button that originated a callback query; for bots only
internal struct GetCallbackQueryMessage: Codable {
    /// Identifier of the callback query
    internal let callbackQueryId: TdInt64

    /// Identifier of the chat the message belongs to
    internal let chatId: Int64

    /// Message identifier
    internal let messageId: Int64

    internal init(
        callbackQueryId: TdInt64,
        chatId: Int64,
        messageId: Int64
    ) {
        self.callbackQueryId = callbackQueryId
        self.chatId = chatId
        self.messageId = messageId
    }
}
