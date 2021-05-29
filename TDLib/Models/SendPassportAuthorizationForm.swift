//
//  SendPassportAuthorizationForm.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends a Telegram Passport authorization form, effectively sharing data with the service. This method must be called after getPassportAuthorizationFormAvailableElements if some previously available elements are going to be reused
internal struct SendPassportAuthorizationForm: Codable {
    /// Authorization form identifier
    internal let autorizationFormId: Int

    /// Types of Telegram Passport elements chosen by user to complete the authorization form
    internal let types: [PassportElementType]

    internal init(
        autorizationFormId: Int,
        types: [PassportElementType]
    ) {
        self.autorizationFormId = autorizationFormId
        self.types = types
    }
}
