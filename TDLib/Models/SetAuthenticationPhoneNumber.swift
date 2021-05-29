//
//  SetAuthenticationPhoneNumber.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber, or if there is no pending authentication query and the current authorization state is authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
internal struct SetAuthenticationPhoneNumber: Codable {
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
