//
//  PassportAuthorizationForm.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a Telegram Passport authorization form that was requested
internal struct PassportAuthorizationForm: Codable {
    /// Unique identifier of the authorization form
    internal let id: Int

    /// URL for the privacy policy of the service; may be empty
    internal let privacyPolicyUrl: String

    /// Information about the Telegram Passport elements that must be provided to complete the form
    internal let requiredElements: [PassportRequiredElement]

    internal init(
        id: Int,
        privacyPolicyUrl: String,
        requiredElements: [PassportRequiredElement]
    ) {
        self.id = id
        self.privacyPolicyUrl = privacyPolicyUrl
        self.requiredElements = requiredElements
    }
}
