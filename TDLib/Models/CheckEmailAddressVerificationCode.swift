//
//  CheckEmailAddressVerificationCode.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Checks the email address verification code for Telegram Passport
internal struct CheckEmailAddressVerificationCode: Codable {
    /// Verification code
    internal let code: String

    internal init(code: String) {
        self.code = code
    }
}
