//
//  EditMessageText.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side
internal struct EditMessageText: Codable {
    /// The chat the message belongs to
    internal let chatId: Int64

    /// New text content of the message. Should be of type inputMessageText
    internal let inputMessageContent: InputMessageContent

    /// Identifier of the message
    internal let messageId: Int64

    /// The new message reply markup; for bots only
    internal let replyMarkup: ReplyMarkup

    internal init(
        chatId: Int64,
        inputMessageContent: InputMessageContent,
        messageId: Int64,
        replyMarkup: ReplyMarkup
    ) {
        self.chatId = chatId
        self.inputMessageContent = inputMessageContent
        self.messageId = messageId
        self.replyMarkup = replyMarkup
    }
}
