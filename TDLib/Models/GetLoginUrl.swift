//
//  GetLoginUrl.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns an HTTP URL which can be used to automatically authorize the user on a website after clicking an inline button of type inlineKeyboardButtonTypeLoginUrl. Use the method getLoginUrlInfo to find whether a prior user confirmation is needed. If an error is returned, then the button must be handled as an ordinary URL button
internal struct GetLoginUrl: Codable {
    /// True, if the user allowed the bot to send them messages
    internal let allowWriteAccess: Bool

    /// Button identifier
    internal let buttonId: Int

    /// Chat identifier of the message with the button
    internal let chatId: Int64

    /// Message identifier of the message with the button
    internal let messageId: Int64

    internal init(
        allowWriteAccess: Bool,
        buttonId: Int,
        chatId: Int64,
        messageId: Int64
    ) {
        self.allowWriteAccess = allowWriteAccess
        self.buttonId = buttonId
        self.chatId = chatId
        self.messageId = messageId
    }
}
