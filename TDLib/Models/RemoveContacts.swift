//
//  RemoveContacts.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes users from the contact list
internal struct RemoveContacts: Codable {
    /// Identifiers of users to be deleted
    internal let userIds: [Int]

    internal init(userIds: [Int]) {
        self.userIds = userIds
    }
}
