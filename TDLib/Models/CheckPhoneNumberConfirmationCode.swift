//
//  CheckPhoneNumberConfirmationCode.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Checks phone number confirmation code
internal struct CheckPhoneNumberConfirmationCode: Codable {
    /// The phone number confirmation code
    internal let code: String

    internal init(code: String) {
        self.code = code
    }
}
