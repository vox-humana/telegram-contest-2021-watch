//
//  ShippingOption.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// One shipping option
internal struct ShippingOption: Codable {
    /// Shipping option identifier
    internal let id: String

    /// A list of objects used to calculate the total shipping costs
    internal let priceParts: [LabeledPricePart]

    /// Option title
    internal let title: String

    internal init(
        id: String,
        priceParts: [LabeledPricePart],
        title: String
    ) {
        self.id = id
        self.priceParts = priceParts
        self.title = title
    }
}
