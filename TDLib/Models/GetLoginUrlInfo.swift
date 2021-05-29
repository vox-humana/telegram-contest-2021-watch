//
//  GetLoginUrlInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a button of type inlineKeyboardButtonTypeLoginUrl. The method needs to be called when the user presses the button
internal struct GetLoginUrlInfo: Codable {
    /// Button identifier
    internal let buttonId: Int

    /// Chat identifier of the message with the button
    internal let chatId: Int64

    /// Message identifier of the message with the button
    internal let messageId: Int64

    internal init(
        buttonId: Int,
        chatId: Int64,
        messageId: Int64
    ) {
        self.buttonId = buttonId
        self.chatId = chatId
        self.messageId = messageId
    }
}
