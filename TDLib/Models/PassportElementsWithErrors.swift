//
//  PassportElementsWithErrors.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a Telegram Passport elements and corresponding errors
internal struct PassportElementsWithErrors: Codable {
    /// Telegram Passport elements
    internal let elements: [PassportElement]

    /// Errors in the elements that are already available
    internal let errors: [PassportElementError]

    internal init(
        elements: [PassportElement],
        errors: [PassportElementError]
    ) {
        self.elements = elements
        self.errors = errors
    }
}
