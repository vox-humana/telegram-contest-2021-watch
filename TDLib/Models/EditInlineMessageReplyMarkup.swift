//
//  EditInlineMessageReplyMarkup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits the reply markup of an inline message sent via a bot; for bots only
internal struct EditInlineMessageReplyMarkup: Codable {
    /// Inline message identifier
    internal let inlineMessageId: String

    /// The new message reply markup
    internal let replyMarkup: ReplyMarkup

    internal init(
        inlineMessageId: String,
        replyMarkup: ReplyMarkup
    ) {
        self.inlineMessageId = inlineMessageId
        self.replyMarkup = replyMarkup
    }
}
