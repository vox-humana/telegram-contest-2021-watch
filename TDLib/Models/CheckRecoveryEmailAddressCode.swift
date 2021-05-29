//
//  CheckRecoveryEmailAddressCode.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Checks the 2-step verification recovery email address verification code
internal struct CheckRecoveryEmailAddressCode: Codable {
    /// Verification code
    internal let code: String

    internal init(code: String) {
        self.code = code
    }
}
