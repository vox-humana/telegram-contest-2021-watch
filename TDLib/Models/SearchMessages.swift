//
//  SearchMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)). For optimal performance the number of returned messages is chosen by the library
internal struct SearchMessages: Codable {
    /// Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported
    internal let chatList: ChatList

    /// Filter for message content in the search results; searchMessagesFilterCall, searchMessagesFilterMissedCall, searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterFailedToSend and searchMessagesFilterPinned are unsupported in this function
    internal let filter: SearchMessagesFilter

    /// The maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
    internal let limit: Int

    /// If not 0, the maximum date of the messages to return
    internal let maxDate: Int

    /// If not 0, the minimum date of the messages to return
    internal let minDate: Int

    /// The chat identifier of the last found message, or 0 for the first request
    internal let offsetChatId: Int64

    /// The date of the message starting from which the results should be fetched. Use 0 or any date in the future to get results from the last message
    internal let offsetDate: Int

    /// The message identifier of the last found message, or 0 for the first request
    internal let offsetMessageId: Int64

    /// Query to search for
    internal let query: String

    internal init(
        chatList: ChatList,
        filter: SearchMessagesFilter,
        limit: Int,
        maxDate: Int,
        minDate: Int,
        offsetChatId: Int64,
        offsetDate: Int,
        offsetMessageId: Int64,
        query: String
    ) {
        self.chatList = chatList
        self.filter = filter
        self.limit = limit
        self.maxDate = maxDate
        self.minDate = minDate
        self.offsetChatId = offsetChatId
        self.offsetDate = offsetDate
        self.offsetMessageId = offsetMessageId
        self.query = query
    }
}
