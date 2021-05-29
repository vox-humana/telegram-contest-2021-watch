//
//  SetLocation.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the location of the current user. Needs to be called if GetOption("is_location_visible") is true and location changes for more than 1 kilometer
internal struct SetLocation: Codable {
    /// The new location of the user
    internal let location: Location

    internal init(location: Location) {
        self.location = location
    }
}
