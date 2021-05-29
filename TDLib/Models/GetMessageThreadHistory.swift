//
//  GetMessageThreadHistory.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns messages in a message thread of a message. Can be used only if message.can_get_message_thread == true. Message thread of a channel message is in the channel's linked supergroup. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id). For optimal performance the number of returned messages is chosen by the library
internal struct GetMessageThreadHistory: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
    internal let fromMessageId: Int64

    /// The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. Fewer messages may be returned than specified by the limit, even if the end of the message thread history has not been reached
    internal let limit: Int

    /// Message identifier, which thread history needs to be returned
    internal let messageId: Int64

    /// Specify 0 to get results from exactly the from_message_id or a negative offset up to 99 to get additionally some newer messages
    internal let offset: Int

    internal init(
        chatId: Int64,
        fromMessageId: Int64,
        limit: Int,
        messageId: Int64,
        offset: Int
    ) {
        self.chatId = chatId
        self.fromMessageId = fromMessageId
        self.limit = limit
        self.messageId = messageId
        self.offset = offset
    }
}
