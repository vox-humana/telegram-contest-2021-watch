//
//  GetPassportAuthorizationForm.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a Telegram Passport authorization form for sharing data with a service
internal struct GetPassportAuthorizationForm: Codable {
    /// User identifier of the service's bot
    internal let botUserId: Int

    /// Authorization form nonce provided by the service
    internal let nonce: String

    /// Service's public_key
    internal let publicKey: String

    /// Telegram Passport element types requested by the service
    internal let scope: String

    internal init(
        botUserId: Int,
        nonce: String,
        publicKey: String,
        scope: String
    ) {
        self.botUserId = botUserId
        self.nonce = nonce
        self.publicKey = publicKey
        self.scope = scope
    }
}
