//
//  EncryptedCredentials.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains encrypted Telegram Passport data credentials
internal struct EncryptedCredentials: Codable {
    /// The encrypted credentials
    internal let data: Data

    /// The decrypted data hash
    internal let hash: Data

    /// Secret for data decryption, encrypted with the service's public key
    internal let secret: Data

    internal init(
        data: Data,
        hash: Data,
        secret: Data
    ) {
        self.data = data
        self.hash = hash
        self.secret = secret
    }
}
