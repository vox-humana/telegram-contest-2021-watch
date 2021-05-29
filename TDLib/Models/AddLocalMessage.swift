//
//  AddLocalMessage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message
internal struct AddLocalMessage: Codable {
    /// Target chat
    internal let chatId: Int64

    /// Pass true to disable notification for the message
    internal let disableNotification: Bool

    /// The content of the message to be added
    internal let inputMessageContent: InputMessageContent

    /// Identifier of the message to reply to or 0
    internal let replyToMessageId: Int64

    /// The sender sender of the message
    internal let sender: MessageSender

    internal init(
        chatId: Int64,
        disableNotification: Bool,
        inputMessageContent: InputMessageContent,
        replyToMessageId: Int64,
        sender: MessageSender
    ) {
        self.chatId = chatId
        self.disableNotification = disableNotification
        self.inputMessageContent = inputMessageContent
        self.replyToMessageId = replyToMessageId
        self.sender = sender
    }
}
