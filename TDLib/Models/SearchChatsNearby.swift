//
//  SearchChatsNearby.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a list of users and location-based supergroups nearby. The list of users nearby will be updated for 60 seconds after the request by the updates updateUsersNearby. The request should be sent again every 25 seconds with adjusted location to not miss new chats
internal struct SearchChatsNearby: Codable {
    /// Current user location
    internal let location: Location

    internal init(location: Location) {
        self.location = location
    }
}
