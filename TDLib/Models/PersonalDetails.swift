//
//  PersonalDetails.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the user's personal details
internal struct PersonalDetails: Codable {
    /// Birthdate of the user
    internal let birthdate: Date

    /// A two-letter ISO 3166-1 alpha-2 country code of the user's country
    internal let countryCode: String

    /// First name of the user written in English; 1-255 characters
    internal let firstName: String

    /// Gender of the user, "male" or "female"
    internal let gender: String

    /// Last name of the user written in English; 1-255 characters
    internal let lastName: String

    /// Middle name of the user written in English; 0-255 characters
    internal let middleName: String

    /// Native first name of the user; 1-255 characters
    internal let nativeFirstName: String

    /// Native last name of the user; 1-255 characters
    internal let nativeLastName: String

    /// Native middle name of the user; 0-255 characters
    internal let nativeMiddleName: String

    /// A two-letter ISO 3166-1 alpha-2 country code of the user's residence country
    internal let residenceCountryCode: String

    internal init(
        birthdate: Date,
        countryCode: String,
        firstName: String,
        gender: String,
        lastName: String,
        middleName: String,
        nativeFirstName: String,
        nativeLastName: String,
        nativeMiddleName: String,
        residenceCountryCode: String
    ) {
        self.birthdate = birthdate
        self.countryCode = countryCode
        self.firstName = firstName
        self.gender = gender
        self.lastName = lastName
        self.middleName = middleName
        self.nativeFirstName = nativeFirstName
        self.nativeLastName = nativeLastName
        self.nativeMiddleName = nativeMiddleName
        self.residenceCountryCode = residenceCountryCode
    }
}
