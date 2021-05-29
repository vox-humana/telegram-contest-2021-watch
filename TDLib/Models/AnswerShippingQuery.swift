//
//  AnswerShippingQuery.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets the result of a shipping query; for bots only
internal struct AnswerShippingQuery: Codable {
    /// An error message, empty on success
    internal let errorMessage: String

    /// Available shipping options
    internal let shippingOptions: [ShippingOption]

    /// Identifier of the shipping query
    internal let shippingQueryId: TdInt64

    internal init(
        errorMessage: String,
        shippingOptions: [ShippingOption],
        shippingQueryId: TdInt64
    ) {
        self.errorMessage = errorMessage
        self.shippingOptions = shippingOptions
        self.shippingQueryId = shippingQueryId
    }
}
