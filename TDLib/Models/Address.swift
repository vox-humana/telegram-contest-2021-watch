//
//  Address.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes an address
internal struct Address: Codable {
    /// City
    internal let city: String

    /// A two-letter ISO 3166-1 alpha-2 country code
    internal let countryCode: String

    /// Address postal code
    internal let postalCode: String

    /// State, if applicable
    internal let state: String

    /// First line of the address
    internal let streetLine1: String

    /// Second line of the address
    internal let streetLine2: String

    internal init(
        city: String,
        countryCode: String,
        postalCode: String,
        state: String,
        streetLine1: String,
        streetLine2: String
    ) {
        self.city = city
        self.countryCode = countryCode
        self.postalCode = postalCode
        self.state = state
        self.streetLine1 = streetLine1
        self.streetLine2 = streetLine2
    }
}
