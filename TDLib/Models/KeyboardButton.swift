//
//  KeyboardButton.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a single button in a bot keyboard
internal struct KeyboardButton: Codable {
    /// Text of the button
    internal let text: String

    /// Type of the button
    internal let type: KeyboardButtonType

    internal init(
        text: String,
        type: KeyboardButtonType
    ) {
        self.text = text
        self.type = type
    }
}
