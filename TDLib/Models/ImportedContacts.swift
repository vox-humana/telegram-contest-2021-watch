//
//  ImportedContacts.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents the result of an ImportContacts request
internal struct ImportedContacts: Codable {
    /// The number of users that imported the corresponding contact; 0 for already registered users or if unavailable
    internal let importerCount: [Int]

    /// User identifiers of the imported contacts in the same order as they were specified in the request; 0 if the contact is not yet a registered user
    internal let userIds: [Int]

    internal init(
        importerCount: [Int],
        userIds: [Int]
    ) {
        self.importerCount = importerCount
        self.userIds = userIds
    }
}
