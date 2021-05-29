//
//  InputPassportElementError.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the description of an error in a Telegram Passport element; for bots only
internal struct InputPassportElementError: Codable {
    /// Error message
    internal let message: String

    /// Error source
    internal let source: InputPassportElementErrorSource

    /// Type of Telegram Passport element that has the error
    internal let type: PassportElementType

    internal init(
        message: String,
        source: InputPassportElementErrorSource,
        type: PassportElementType
    ) {
        self.message = message
        self.source = source
        self.type = type
    }
}
