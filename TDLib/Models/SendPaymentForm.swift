//
//  SendPaymentForm.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends a filled-out payment form to the bot for final verification
internal struct SendPaymentForm: Codable {
    /// Chat identifier of the Invoice message
    internal let chatId: Int64

    /// The credentials chosen by user for payment
    internal let credentials: InputCredentials

    /// Message identifier
    internal let messageId: Int64

    /// Identifier returned by validateOrderInfo, or an empty string
    internal let orderInfoId: String

    /// Payment form identifier returned by getPaymentForm
    internal let paymentFormId: TdInt64

    /// Identifier of a chosen shipping option, if applicable
    internal let shippingOptionId: String

    /// Chosen by the user amount of tip in the smallest units of the currency
    internal let tipAmount: Int64

    internal init(
        chatId: Int64,
        credentials: InputCredentials,
        messageId: Int64,
        orderInfoId: String,
        paymentFormId: TdInt64,
        shippingOptionId: String,
        tipAmount: Int64
    ) {
        self.chatId = chatId
        self.credentials = credentials
        self.messageId = messageId
        self.orderInfoId = orderInfoId
        self.paymentFormId = paymentFormId
        self.shippingOptionId = shippingOptionId
        self.tipAmount = tipAmount
    }
}
