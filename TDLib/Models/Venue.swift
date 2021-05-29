//
//  Venue.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a venue
internal struct Venue: Codable {
    /// Venue address; as defined by the sender
    internal let address: String

    /// Identifier of the venue in the provider database; as defined by the sender
    internal let id: String

    /// Venue location; as defined by the sender
    internal let location: Location

    /// Provider of the venue database; as defined by the sender. Currently only "foursquare" and "gplaces" (Google Places) need to be supported
    internal let provider: String

    /// Venue name; as defined by the sender
    internal let title: String

    /// Type of the venue in the provider database; as defined by the sender
    internal let type: String

    internal init(
        address: String,
        id: String,
        location: Location,
        provider: String,
        title: String,
        type: String
    ) {
        self.address = address
        self.id = id
        self.location = location
        self.provider = provider
        self.title = title
        self.type = type
    }
}
