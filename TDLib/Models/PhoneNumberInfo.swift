//
//  PhoneNumberInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a phone number
internal struct PhoneNumberInfo: Codable {
    /// Information about the country to which the phone number belongs; may be null
    internal let country: CountryInfo?

    /// The part of the phone number denoting country calling code or its part
    internal let countryCallingCode: String

    /// The phone number without country calling code formatted accordingly to local rules
    internal let formattedPhoneNumber: String

    internal init(
        country: CountryInfo?,
        countryCallingCode: String,
        formattedPhoneNumber: String
    ) {
        self.country = country
        self.countryCallingCode = countryCallingCode
        self.formattedPhoneNumber = formattedPhoneNumber
    }
}
