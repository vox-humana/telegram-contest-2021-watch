//
//  PasswordState.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents the current state of 2-step verification
internal struct PasswordState: Codable {
    /// True, if some Telegram Passport elements were saved
    internal let hasPassportData: Bool

    /// True, if a 2-step verification password is set
    internal let hasPassword: Bool

    /// True, if a recovery email is set
    internal let hasRecoveryEmailAddress: Bool

    /// Hint for the password; may be empty
    internal let passwordHint: String

    /// Information about the recovery email address to which the confirmation email was sent; may be null
    internal let recoveryEmailAddressCodeInfo: EmailAddressAuthenticationCodeInfo?

    internal init(
        hasPassportData: Bool,
        hasPassword: Bool,
        hasRecoveryEmailAddress: Bool,
        passwordHint: String,
        recoveryEmailAddressCodeInfo: EmailAddressAuthenticationCodeInfo?
    ) {
        self.hasPassportData = hasPassportData
        self.hasPassword = hasPassword
        self.hasRecoveryEmailAddress = hasRecoveryEmailAddress
        self.passwordHint = passwordHint
        self.recoveryEmailAddressCodeInfo = recoveryEmailAddressCodeInfo
    }
}
