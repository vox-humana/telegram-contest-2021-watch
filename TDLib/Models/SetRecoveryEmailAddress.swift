//
//  SetRecoveryEmailAddress.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the 2-step verification recovery email address of the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed. If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation
internal struct SetRecoveryEmailAddress: Codable {
    /// New recovery email address
    internal let newRecoveryEmailAddress: String

    /// Password of the current user
    internal let password: String

    internal init(
        newRecoveryEmailAddress: String,
        password: String
    ) {
        self.newRecoveryEmailAddress = newRecoveryEmailAddress
        self.password = password
    }
}
