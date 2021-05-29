//
//  CreateTemporaryPassword.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Creates a new temporary password for processing payments
internal struct CreateTemporaryPassword: Codable {
    /// Persistent user password
    internal let password: String

    /// Time during which the temporary password will be valid, in seconds; should be between 60 and 86400
    internal let validFor: Int

    internal init(
        password: String,
        validFor: Int
    ) {
        self.password = password
        self.validFor = validFor
    }
}
