//
//  GetMessagePublicForwards.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns forwarded copies of a channel message to different public channels. For optimal performance the number of returned messages is chosen by the library
internal struct GetMessagePublicForwards: Codable {
    /// Chat identifier of the message
    internal let chatId: Int64

    /// The maximum number of messages to be returned; must be positive and can't be greater than 100. Fewer messages may be returned than specified by the limit, even if the end of the list has not been reached
    internal let limit: Int

    /// Message identifier
    internal let messageId: Int64

    /// Offset of the first entry to return as received from the previous request; use empty string to get first chunk of results
    internal let offset: String

    internal init(
        chatId: Int64,
        limit: Int,
        messageId: Int64,
        offset: String
    ) {
        self.chatId = chatId
        self.limit = limit
        self.messageId = messageId
        self.offset = offset
    }
}
