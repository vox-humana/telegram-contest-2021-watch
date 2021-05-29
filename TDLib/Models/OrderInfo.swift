//
//  OrderInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Order information
internal struct OrderInfo: Codable {
    /// Email address of the user
    internal let emailAddress: String

    /// Name of the user
    internal let name: String

    /// Phone number of the user
    internal let phoneNumber: String

    /// Shipping address for this order; may be null
    internal let shippingAddress: Address?

    internal init(
        emailAddress: String,
        name: String,
        phoneNumber: String,
        shippingAddress: Address?
    ) {
        self.emailAddress = emailAddress
        self.name = name
        self.phoneNumber = phoneNumber
        self.shippingAddress = shippingAddress
    }
}
