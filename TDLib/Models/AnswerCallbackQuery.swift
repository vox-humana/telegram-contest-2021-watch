//
//  AnswerCallbackQuery.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets the result of a callback query; for bots only
internal struct AnswerCallbackQuery: Codable {
    /// Time during which the result of the query can be cached, in seconds
    internal let cacheTime: Int

    /// Identifier of the callback query
    internal let callbackQueryId: TdInt64

    /// If true, an alert should be shown to the user instead of a toast notification
    internal let showAlert: Bool

    /// Text of the answer
    internal let text: String

    /// URL to be opened
    internal let url: String

    internal init(
        cacheTime: Int,
        callbackQueryId: TdInt64,
        showAlert: Bool,
        text: String,
        url: String
    ) {
        self.cacheTime = cacheTime
        self.callbackQueryId = callbackQueryId
        self.showAlert = showAlert
        self.text = text
        self.url = url
    }
}
