//
//  DeleteAllCallMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes all call messages
internal struct DeleteAllCallMessages: Codable {
    /// Pass true to delete the messages for all users
    internal let revoke: Bool

    internal init(revoke: Bool) {
        self.revoke = revoke
    }
}
