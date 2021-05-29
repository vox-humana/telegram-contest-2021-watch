//
//  SendEmailAddressVerificationCode.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends a code to verify an email address to be added to a user's Telegram Passport
internal struct SendEmailAddressVerificationCode: Codable {
    /// Email address
    internal let emailAddress: String

    internal init(emailAddress: String) {
        self.emailAddress = emailAddress
    }
}
