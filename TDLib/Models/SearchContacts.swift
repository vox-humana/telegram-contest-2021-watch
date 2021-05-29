//
//  SearchContacts.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for the specified query in the first names, last names and usernames of the known user contacts
internal struct SearchContacts: Codable {
    /// The maximum number of users to be returned
    internal let limit: Int

    /// Query to search for; may be empty to return all contacts
    internal let query: String

    internal init(
        limit: Int,
        query: String
    ) {
        self.limit = limit
        self.query = query
    }
}
