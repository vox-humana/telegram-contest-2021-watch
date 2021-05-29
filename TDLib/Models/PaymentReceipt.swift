//
//  PaymentReceipt.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a successful payment
internal struct PaymentReceipt: Codable {
    /// Title of the saved credentials chosen by the buyer
    internal let credentialsTitle: String

    /// Point in time (Unix timestamp) when the payment was made
    internal let date: Int

    internal let description: String

    /// Contains information about the invoice
    internal let invoice: Invoice

    /// Order information; may be null
    internal let orderInfo: OrderInfo?

    /// User identifier of the payment provider bot
    internal let paymentsProviderUserId: Int

    /// Product photo; may be null
    internal let photo: Photo?

    /// User identifier of the seller bot
    internal let sellerBotUserId: Int

    /// Chosen shipping option; may be null
    internal let shippingOption: ShippingOption?

    /// The amount of tip chosen by the buyer in the smallest units of the currency
    internal let tipAmount: Int64

    /// Product title
    internal let title: String

    internal init(
        credentialsTitle: String,
        date: Int,
        description: String,
        invoice: Invoice,
        orderInfo: OrderInfo?,
        paymentsProviderUserId: Int,
        photo: Photo?,
        sellerBotUserId: Int,
        shippingOption: ShippingOption?,
        tipAmount: Int64,
        title: String
    ) {
        self.credentialsTitle = credentialsTitle
        self.date = date
        self.description = description
        self.invoice = invoice
        self.orderInfo = orderInfo
        self.paymentsProviderUserId = paymentsProviderUserId
        self.photo = photo
        self.sellerBotUserId = sellerBotUserId
        self.shippingOption = shippingOption
        self.tipAmount = tipAmount
        self.title = title
    }
}
