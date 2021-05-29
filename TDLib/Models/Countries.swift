//
//  Countries.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about countries
internal struct Countries: Codable {
    /// The list of countries
    internal let countries: [CountryInfo]

    internal init(countries: [CountryInfo]) {
        self.countries = countries
    }
}
