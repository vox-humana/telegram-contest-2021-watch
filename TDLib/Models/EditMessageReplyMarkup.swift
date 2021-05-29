//
//  EditMessageReplyMarkup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side
internal struct EditMessageReplyMarkup: Codable {
    /// The chat the message belongs to
    internal let chatId: Int64

    /// Identifier of the message
    internal let messageId: Int64

    /// The new message reply markup
    internal let replyMarkup: ReplyMarkup

    internal init(
        chatId: Int64,
        messageId: Int64,
        replyMarkup: ReplyMarkup
    ) {
        self.chatId = chatId
        self.messageId = messageId
        self.replyMarkup = replyMarkup
    }
}
