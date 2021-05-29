//
//  PassportElementError.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the description of an error in a Telegram Passport element
internal struct PassportElementError: Codable {
    /// Error message
    internal let message: String

    /// Error source
    internal let source: PassportElementErrorSource

    /// Type of the Telegram Passport element which has the error
    internal let type: PassportElementType

    internal init(
        message: String,
        source: PassportElementErrorSource,
        type: PassportElementType
    ) {
        self.message = message
        self.source = source
        self.type = type
    }
}
