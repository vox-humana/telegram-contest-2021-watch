//
//  PassportElements.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about saved Telegram Passport elements
internal struct PassportElements: Codable {
    /// Telegram Passport elements
    internal let elements: [PassportElement]

    internal init(elements: [PassportElement]) {
        self.elements = elements
    }
}
