//
//  SearchChatsOnServer.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the main chat list
internal struct SearchChatsOnServer: Codable {
    /// The maximum number of chats to be returned
    internal let limit: Int

    /// Query to search for
    internal let query: String

    internal init(
        limit: Int,
        query: String
    ) {
        self.limit = limit
        self.query = query
    }
}
