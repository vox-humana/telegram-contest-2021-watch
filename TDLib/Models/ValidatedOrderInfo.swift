//
//  ValidatedOrderInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a temporary identifier of validated order information, which is stored for one hour. Also contains the available shipping options
internal struct ValidatedOrderInfo: Codable {
    /// Temporary identifier of the order information
    internal let orderInfoId: String

    /// Available shipping options
    internal let shippingOptions: [ShippingOption]

    internal init(
        orderInfoId: String,
        shippingOptions: [ShippingOption]
    ) {
        self.orderInfoId = orderInfoId
        self.shippingOptions = shippingOptions
    }
}
