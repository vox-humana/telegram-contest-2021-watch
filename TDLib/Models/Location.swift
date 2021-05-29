//
//  Location.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a location on planet Earth
internal struct Location: Codable {
    /// The estimated horizontal accuracy of the location, in meters; as defined by the sender. 0 if unknown
    internal let horizontalAccuracy: Double

    /// Latitude of the location in degrees; as defined by the sender
    internal let latitude: Double

    /// Longitude of the location, in degrees; as defined by the sender
    internal let longitude: Double

    internal init(
        horizontalAccuracy: Double,
        latitude: Double,
        longitude: Double
    ) {
        self.horizontalAccuracy = horizontalAccuracy
        self.latitude = latitude
        self.longitude = longitude
    }
}
