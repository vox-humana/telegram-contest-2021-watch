//
//  SendPhoneNumberConfirmationCode.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends phone number confirmation code. Should be called when user presses "https://t.me/confirmphone?phone=*******&hash=**********" or "tg://confirmphone?phone=*******&hash=**********" link
internal struct SendPhoneNumberConfirmationCode: Codable {
    /// Value of the "hash" parameter from the link
    internal let hash: String

    /// Value of the "phone" parameter from the link
    internal let phoneNumber: String

    /// Settings for the authentication of the user's phone number
    internal let settings: PhoneNumberAuthenticationSettings

    internal init(
        hash: String,
        phoneNumber: String,
        settings: PhoneNumberAuthenticationSettings
    ) {
        self.hash = hash
        self.phoneNumber = phoneNumber
        self.settings = settings
    }
}
