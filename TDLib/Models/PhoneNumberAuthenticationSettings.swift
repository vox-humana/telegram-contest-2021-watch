//
//  PhoneNumberAuthenticationSettings.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains settings for the authentication of the user's phone number
internal struct PhoneNumberAuthenticationSettings: Codable {
    /// Pass true if the authentication code may be sent via flash call to the specified phone number
    internal let allowFlashCall: Bool

    /// For official applications only. True, if the application can use Android SMS Retriever API (requires Google Play Services >= 10.2) to automatically receive the authentication code from the SMS. See https://developers.google.com/identity/sms-retriever/ for more details
    internal let allowSmsRetrieverApi: Bool

    /// Pass true if the authenticated phone number is used on the current device
    internal let isCurrentPhoneNumber: Bool

    internal init(
        allowFlashCall: Bool,
        allowSmsRetrieverApi: Bool,
        isCurrentPhoneNumber: Bool
    ) {
        self.allowFlashCall = allowFlashCall
        self.allowSmsRetrieverApi = allowSmsRetrieverApi
        self.isCurrentPhoneNumber = isCurrentPhoneNumber
    }
}
