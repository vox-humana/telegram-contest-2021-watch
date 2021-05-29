//
//  EditInlineMessageCaption.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits the caption of an inline message sent via a bot; for bots only
internal struct EditInlineMessageCaption: Codable {
    /// New message content caption; 0-GetOption("message_caption_length_max") characters
    internal let caption: FormattedText

    /// Inline message identifier
    internal let inlineMessageId: String

    /// The new message reply markup
    internal let replyMarkup: ReplyMarkup

    internal init(
        caption: FormattedText,
        inlineMessageId: String,
        replyMarkup: ReplyMarkup
    ) {
        self.caption = caption
        self.inlineMessageId = inlineMessageId
        self.replyMarkup = replyMarkup
    }
}
