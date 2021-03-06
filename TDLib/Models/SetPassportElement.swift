//
//  SetPassportElement.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first
internal struct SetPassportElement: Codable {
    /// Input Telegram Passport element
    internal let element: InputPassportElement

    /// Password of the current user
    internal let password: String

    internal init(
        element: InputPassportElement,
        password: String
    ) {
        self.element = element
        self.password = password
    }
}
