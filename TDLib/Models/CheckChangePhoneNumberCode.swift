//
//  CheckChangePhoneNumberCode.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Checks the authentication code sent to confirm a new phone number of the user
internal struct CheckChangePhoneNumberCode: Codable {
    /// Verification code received by SMS, phone call or flash call
    internal let code: String

    internal init(code: String) {
        self.code = code
    }
}
