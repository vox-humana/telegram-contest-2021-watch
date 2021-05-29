//
//  ValidateOrderInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Validates the order information provided by a user and returns the available shipping options for a flexible invoice
internal struct ValidateOrderInfo: Codable {
    /// True, if the order information can be saved
    internal let allowSave: Bool

    /// Chat identifier of the Invoice message
    internal let chatId: Int64

    /// Message identifier
    internal let messageId: Int64

    /// The order information, provided by the user
    internal let orderInfo: OrderInfo

    internal init(
        allowSave: Bool,
        chatId: Int64,
        messageId: Int64,
        orderInfo: OrderInfo
    ) {
        self.allowSave = allowSave
        self.chatId = chatId
        self.messageId = messageId
        self.orderInfo = orderInfo
    }
}
