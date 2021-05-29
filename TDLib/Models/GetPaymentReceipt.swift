//
//  GetPaymentReceipt.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a successful payment
internal struct GetPaymentReceipt: Codable {
    /// Chat identifier of the PaymentSuccessful message
    internal let chatId: Int64

    /// Message identifier
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.messageId = messageId
    }
}
