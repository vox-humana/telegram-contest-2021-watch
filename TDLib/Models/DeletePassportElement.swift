//
//  DeletePassportElement.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes a Telegram Passport element
internal struct DeletePassportElement: Codable {
    /// Element type
    internal let type: PassportElementType

    internal init(type: PassportElementType) {
        self.type = type
    }
}
