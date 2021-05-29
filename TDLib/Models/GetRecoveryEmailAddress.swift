//
//  GetRecoveryEmailAddress.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a 2-step verification recovery email address that was previously set up. This method can be used to verify a password provided by the user
internal struct GetRecoveryEmailAddress: Codable {
    /// The password for the current user
    internal let password: String

    internal init(password: String) {
        self.password = password
    }
}
