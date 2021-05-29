//
//  SearchChatMembers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for a specified query in the first name, last name and username of the members of a specified chat. Requires administrator rights in channels
internal struct SearchChatMembers: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The type of users to return. By default, chatMembersFilterMembers
    internal let filter: ChatMembersFilter

    /// The maximum number of users to be returned
    internal let limit: Int

    /// Query to search for
    internal let query: String

    internal init(
        chatId: Int64,
        filter: ChatMembersFilter,
        limit: Int,
        query: String
    ) {
        self.chatId = chatId
        self.filter = filter
        self.limit = limit
        self.query = query
    }
}
