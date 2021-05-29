//
//  GetPreferredCountryLanguage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns an IETF language tag of the language preferred in the country, which should be used to fill native fields in Telegram Passport personal details. Returns a 404 error if unknown
internal struct GetPreferredCountryLanguage: Codable {
    /// A two-letter ISO 3166-1 alpha-2 country code
    internal let countryCode: String

    internal init(countryCode: String) {
        self.countryCode = countryCode
    }
}
