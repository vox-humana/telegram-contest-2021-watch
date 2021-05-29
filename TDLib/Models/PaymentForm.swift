//
//  PaymentForm.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about an invoice payment form
internal struct PaymentForm: Codable {
    /// True, if the user can choose to save credentials
    internal let canSaveCredentials: Bool

    /// The payment form identifier
    internal let id: TdInt64

    /// Full information of the invoice
    internal let invoice: Invoice

    /// True, if the user will be able to save credentials protected by a password they set up
    internal let needPassword: Bool

    /// Contains information about the payment provider, if available, to support it natively without the need for opening the URL; may be null
    internal let paymentsProvider: PaymentsProviderStripe?

    /// User identifier of the payment provider bot
    internal let paymentsProviderUserId: Int

    /// Contains information about saved card credentials; may be null
    internal let savedCredentials: SavedCredentials?

    /// Saved server-side order information; may be null
    internal let savedOrderInfo: OrderInfo?

    /// User identifier of the seller bot
    internal let sellerBotUserId: Int

    /// Payment form URL
    internal let url: String

    internal init(
        canSaveCredentials: Bool,
        id: TdInt64,
        invoice: Invoice,
        needPassword: Bool,
        paymentsProvider: PaymentsProviderStripe?,
        paymentsProviderUserId: Int,
        savedCredentials: SavedCredentials?,
        savedOrderInfo: OrderInfo?,
        sellerBotUserId: Int,
        url: String
    ) {
        self.canSaveCredentials = canSaveCredentials
        self.id = id
        self.invoice = invoice
        self.needPassword = needPassword
        self.paymentsProvider = paymentsProvider
        self.paymentsProviderUserId = paymentsProviderUserId
        self.savedCredentials = savedCredentials
        self.savedOrderInfo = savedOrderInfo
        self.sellerBotUserId = sellerBotUserId
        self.url = url
    }
}
