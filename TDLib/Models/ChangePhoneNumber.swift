//
//  ChangePhoneNumber.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the phone number of the user and sends an authentication code to the user's new phone number. On success, returns information about the sent code
internal struct ChangePhoneNumber: Codable {
    /// The new phone number of the user in international format
    internal let phoneNumber: String

    /// Settings for the authentication of the user's phone number
    internal let settings: PhoneNumberAuthenticationSettings

    internal init(
        phoneNumber: String,
        settings: PhoneNumberAuthenticationSettings
    ) {
        self.phoneNumber = phoneNumber
        self.settings = settings
    }
}
