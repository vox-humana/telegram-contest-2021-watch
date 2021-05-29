//
//  ChatsNearby.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a list of chats located nearby
internal struct ChatsNearby: Codable {
    /// List of location-based supergroups nearby
    internal let supergroupsNearby: [ChatNearby]

    /// List of users nearby
    internal let usersNearby: [ChatNearby]

    internal init(
        supergroupsNearby: [ChatNearby],
        usersNearby: [ChatNearby]
    ) {
        self.supergroupsNearby = supergroupsNearby
        self.usersNearby = usersNearby
    }
}
