//
//  SetPassportElementErrors.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Informs the user that some of the elements in their Telegram Passport contain errors; for bots only. The user will not be able to resend the elements, until the errors are fixed
internal struct SetPassportElementErrors: Codable {
    /// The errors
    internal let errors: [InputPassportElementError]

    /// User identifier
    internal let userId: Int

    internal init(
        errors: [InputPassportElementError],
        userId: Int
    ) {
        self.errors = errors
        self.userId = userId
    }
}
