//
//  SetPassword.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the password for the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed
internal struct SetPassword: Codable {
    /// New password hint; may be empty
    internal let newHint: String

    /// New password of the user; may be empty to remove the password
    internal let newPassword: String

    /// New recovery email address; may be empty
    internal let newRecoveryEmailAddress: String

    /// Previous password of the user
    internal let oldPassword: String

    /// Pass true if the recovery email address should be changed
    internal let setRecoveryEmailAddress: Bool

    internal init(
        newHint: String,
        newPassword: String,
        newRecoveryEmailAddress: String,
        oldPassword: String,
        setRecoveryEmailAddress: Bool
    ) {
        self.newHint = newHint
        self.newPassword = newPassword
        self.newRecoveryEmailAddress = newRecoveryEmailAddress
        self.oldPassword = oldPassword
        self.setRecoveryEmailAddress = setRecoveryEmailAddress
    }
}
