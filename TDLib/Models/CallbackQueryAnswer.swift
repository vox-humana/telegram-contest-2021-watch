//
//  CallbackQueryAnswer.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a bot's answer to a callback query
internal struct CallbackQueryAnswer: Codable {
    /// True, if an alert should be shown to the user instead of a toast notification
    internal let showAlert: Bool

    /// Text of the answer
    internal let text: String

    /// URL to be opened
    internal let url: String

    internal init(
        showAlert: Bool,
        text: String,
        url: String
    ) {
        self.showAlert = showAlert
        self.text = text
        self.url = url
    }
}
