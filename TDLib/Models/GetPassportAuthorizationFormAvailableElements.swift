//
//  GetPassportAuthorizationFormAvailableElements.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form
internal struct GetPassportAuthorizationFormAvailableElements: Codable {
    /// Authorization form identifier
    internal let autorizationFormId: Int

    /// Password of the current user
    internal let password: String

    internal init(
        autorizationFormId: Int,
        password: String
    ) {
        self.autorizationFormId = autorizationFormId
        self.password = password
    }
}
