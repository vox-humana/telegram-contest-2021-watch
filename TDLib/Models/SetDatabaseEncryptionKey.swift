//
//  SetDatabaseEncryptionKey.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain
internal struct SetDatabaseEncryptionKey: Codable {
    /// New encryption key
    internal let newEncryptionKey: Data

    internal init(newEncryptionKey: Data) {
        self.newEncryptionKey = newEncryptionKey
    }
}
