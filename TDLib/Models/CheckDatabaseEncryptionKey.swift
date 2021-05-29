//
//  CheckDatabaseEncryptionKey.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Checks the database encryption key for correctness. Works only when the current authorization state is authorizationStateWaitEncryptionKey
internal struct CheckDatabaseEncryptionKey: Codable {
    /// Encryption key to check or set up
    internal let encryptionKey: Data

    internal init(encryptionKey: Data) {
        self.encryptionKey = encryptionKey
    }
}
