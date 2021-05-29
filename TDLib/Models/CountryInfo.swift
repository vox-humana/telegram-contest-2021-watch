//
//  CountryInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a country
internal struct CountryInfo: Codable {
    /// List of country calling codes
    internal let callingCodes: [String]

    /// A two-letter ISO 3166-1 alpha-2 country code
    internal let countryCode: String

    /// English name of the country
    internal let englishName: String

    /// True, if the country should be hidden from the list of all countries
    internal let isHidden: Bool

    /// Native name of the country
    internal let name: String

    internal init(
        callingCodes: [String],
        countryCode: String,
        englishName: String,
        isHidden: Bool,
        name: String
    ) {
        self.callingCodes = callingCodes
        self.countryCode = countryCode
        self.englishName = englishName
        self.isHidden = isHidden
        self.name = name
    }
}
