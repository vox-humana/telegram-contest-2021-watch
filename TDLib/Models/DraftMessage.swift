//
//  DraftMessage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a message draft
internal struct DraftMessage: Codable {
    /// Point in time (Unix timestamp) when the draft was created
    internal let date: Int

    /// Content of the message draft; this should always be of type inputMessageText
    internal let inputMessageText: InputMessageContent

    /// Identifier of the message to reply to; 0 if none
    internal let replyToMessageId: Int64

    internal init(
        date: Int,
        inputMessageText: InputMessageContent,
        replyToMessageId: Int64
    ) {
        self.date = date
        self.inputMessageText = inputMessageText
        self.replyToMessageId = replyToMessageId
    }
}
