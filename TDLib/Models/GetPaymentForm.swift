//
//  GetPaymentForm.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns an invoice payment form. This method should be called when the user presses inlineKeyboardButtonBuy
internal struct GetPaymentForm: Codable {
    /// Chat identifier of the Invoice message
    internal let chatId: Int64

    /// Message identifier
    internal let messageId: Int64

    /// Preferred payment form theme
    internal let theme: PaymentFormTheme

    internal init(
        chatId: Int64,
        messageId: Int64,
        theme: PaymentFormTheme
    ) {
        self.chatId = chatId
        self.messageId = messageId
        self.theme = theme
    }
}
