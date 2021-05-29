//
//  InlineKeyboardButton.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a single button in an inline keyboard
internal struct InlineKeyboardButton: Codable {
    /// Text of the button
    internal let text: String

    /// Type of the button
    internal let type: InlineKeyboardButtonType

    internal init(
        text: String,
        type: InlineKeyboardButtonType
    ) {
        self.text = text
        self.type = type
    }
}
