//
//  SearchChatMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query (searchSecretMessages should be used instead), or without an enabled message database. For optimal performance the number of returned messages is chosen by the library
internal struct SearchChatMessages: Codable {
    /// Identifier of the chat in which to search messages
    internal let chatId: Int64

    /// Filter for message content in the search results
    internal let filter: SearchMessagesFilter

    /// Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
    internal let fromMessageId: Int64

    /// The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
    internal let limit: Int

    /// If not 0, only messages in the specified thread will be returned; supergroups only
    internal let messageThreadId: Int64

    /// Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages
    internal let offset: Int

    /// Query to search for
    internal let query: String

    /// If not null, only messages sent by the specified sender will be returned. Not supported in secret chats
    internal let sender: MessageSender

    internal init(
        chatId: Int64,
        filter: SearchMessagesFilter,
        fromMessageId: Int64,
        limit: Int,
        messageThreadId: Int64,
        offset: Int,
        query: String,
        sender: MessageSender
    ) {
        self.chatId = chatId
        self.filter = filter
        self.fromMessageId = fromMessageId
        self.limit = limit
        self.messageThreadId = messageThreadId
        self.offset = offset
        self.query = query
        self.sender = sender
    }
}
