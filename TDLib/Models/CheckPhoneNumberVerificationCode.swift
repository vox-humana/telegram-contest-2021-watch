//
//  CheckPhoneNumberVerificationCode.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Checks the phone number verification code for Telegram Passport
internal struct CheckPhoneNumberVerificationCode: Codable {
    /// Verification code
    internal let code: String

    internal init(code: String) {
        self.code = code
    }
}
