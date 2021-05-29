//
//  RecoveryEmailAddress.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about the current recovery email address
internal struct RecoveryEmailAddress: Codable {
    /// Recovery email address
    internal let recoveryEmailAddress: String

    internal init(recoveryEmailAddress: String) {
        self.recoveryEmailAddress = recoveryEmailAddress
    }
}
