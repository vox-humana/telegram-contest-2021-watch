//
//  AnswerPreCheckoutQuery.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets the result of a pre-checkout query; for bots only
internal struct AnswerPreCheckoutQuery: Codable {
    /// An error message, empty on success
    internal let errorMessage: String

    /// Identifier of the pre-checkout query
    internal let preCheckoutQueryId: TdInt64

    internal init(
        errorMessage: String,
        preCheckoutQueryId: TdInt64
    ) {
        self.errorMessage = errorMessage
        self.preCheckoutQueryId = preCheckoutQueryId
    }
}
