//
//  CreateNewBasicGroupChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns the newly created chat
internal struct CreateNewBasicGroupChat: Codable {
    /// Title of the new basic group; 1-128 characters
    internal let title: String

    /// Identifiers of users to be added to the basic group
    internal let userIds: [Int]

    internal init(
        title: String,
        userIds: [Int]
    ) {
        self.title = title
        self.userIds = userIds
    }
}
