//
//  EditInlineMessageText.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits the text of an inline text or game message sent via a bot; for bots only
internal struct EditInlineMessageText: Codable {
    /// Inline message identifier
    internal let inlineMessageId: String

    /// New text content of the message. Should be of type inputMessageText
    internal let inputMessageContent: InputMessageContent

    /// The new message reply markup
    internal let replyMarkup: ReplyMarkup

    internal init(
        inlineMessageId: String,
        inputMessageContent: InputMessageContent,
        replyMarkup: ReplyMarkup
    ) {
        self.inlineMessageId = inlineMessageId
        self.inputMessageContent = inputMessageContent
        self.replyMarkup = replyMarkup
    }
}
