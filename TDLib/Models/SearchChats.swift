//
//  SearchChats.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for the specified query in the title and username of already known chats, this is an offline request. Returns chats in the order seen in the main chat list
internal struct SearchChats: Codable {
    /// The maximum number of chats to be returned
    internal let limit: Int

    /// Query to search for. If the query is empty, returns up to 20 recently found chats
    internal let query: String

    internal init(
        limit: Int,
        query: String
    ) {
        self.limit = limit
        self.query = query
    }
}
