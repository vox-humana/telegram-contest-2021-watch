//
//  GetPassportElement.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns one of the available Telegram Passport elements
internal struct GetPassportElement: Codable {
    /// Password of the current user
    internal let password: String

    /// Telegram Passport element type
    internal let type: PassportElementType

    internal init(
        password: String,
        type: PassportElementType
    ) {
        self.password = password
        self.type = type
    }
}
