//
//  LabeledPricePart.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Portion of the price of a product (e.g., "delivery cost", "tax amount")
internal struct LabeledPricePart: Codable {
    /// Currency amount in the smallest units of the currency
    internal let amount: Int64

    /// Label for this portion of the product price
    internal let label: String

    internal init(
        amount: Int64,
        label: String
    ) {
        self.amount = amount
        self.label = label
    }
}
