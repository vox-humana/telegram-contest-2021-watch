//
//  SendPhoneNumberVerificationCode.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends a code to verify a phone number to be added to a user's Telegram Passport
internal struct SendPhoneNumberVerificationCode: Codable {
    /// The phone number of the user, in international format
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
