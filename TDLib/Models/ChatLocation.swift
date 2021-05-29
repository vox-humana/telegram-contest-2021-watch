//
//  ChatLocation.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a location to which a chat is connected
internal struct ChatLocation: Codable {
    /// Location address; 1-64 characters, as defined by the chat owner
    internal let address: String

    /// The location
    internal let location: Location

    internal init(
        address: String,
        location: Location
    ) {
        self.address = address
        self.location = location
    }
}
