//
//  SearchSecretMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance the number of returned messages is chosen by the library
internal struct SearchSecretMessages: Codable {
    /// Identifier of the chat in which to search. Specify 0 to search in all secret chats
    internal let chatId: Int64

    /// A filter for message content in the search results
    internal let filter: SearchMessagesFilter

    /// The maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
    internal let limit: Int

    /// Offset of the first entry to return as received from the previous request; use empty string to get first chunk of results
    internal let offset: String

    /// Query to search for. If empty, searchChatMessages should be used instead
    internal let query: String

    internal init(
        chatId: Int64,
        filter: SearchMessagesFilter,
        limit: Int,
        offset: String,
        query: String
    ) {
        self.chatId = chatId
        self.filter = filter
        self.limit = limit
        self.offset = offset
        self.query = query
    }
}
