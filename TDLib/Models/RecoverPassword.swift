//
//  RecoverPassword.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Recovers the password using a recovery code sent to an email address that was previously set up
internal struct RecoverPassword: Codable {
    /// Recovery code to check
    internal let recoveryCode: String

    internal init(recoveryCode: String) {
        self.recoveryCode = recoveryCode
    }
}
