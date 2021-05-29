//
//  TemporaryPasswordState.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about the availability of a temporary password, which can be used for payments
internal struct TemporaryPasswordState: Codable {
    /// True, if a temporary password is available
    internal let hasPassword: Bool

    /// Time left before the temporary password expires, in seconds
    internal let validFor: Int

    internal init(
        hasPassword: Bool,
        validFor: Int
    ) {
        self.hasPassword = hasPassword
        self.validFor = validFor
    }
}
