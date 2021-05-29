//
//  StopPoll.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Stops a poll. A poll in a message can be stopped when the message has can_be_edited flag set
internal struct StopPoll: Codable {
    /// Identifier of the chat to which the poll belongs
    internal let chatId: Int64

    /// Identifier of the message containing the poll
    internal let messageId: Int64

    /// The new message reply markup; for bots only
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
