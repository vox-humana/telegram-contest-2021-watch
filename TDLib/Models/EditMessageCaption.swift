//
//  EditMessageCaption.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits the message content caption. Returns the edited message after the edit is completed on the server side
internal struct EditMessageCaption: Codable {
    /// New message content caption; 0-GetOption("message_caption_length_max") characters
    internal let caption: FormattedText

    /// The chat the message belongs to
    internal let chatId: Int64

    /// Identifier of the message
    internal let messageId: Int64

    /// The new message reply markup; for bots only
    internal let replyMarkup: ReplyMarkup

    internal init(
        caption: FormattedText,
        chatId: Int64,
        messageId: Int64,
        replyMarkup: ReplyMarkup
    ) {
        self.caption = caption
        self.chatId = chatId
        self.messageId = messageId
        self.replyMarkup = replyMarkup
    }
}
