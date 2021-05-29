//
//  PinChatMessage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Pins a message in a chat; requires can_pin_messages rights or can_edit_messages rights in the channel
internal struct PinChatMessage: Codable {
    /// Identifier of the chat
    internal let chatId: Int64

    /// True, if there should be no notification about the pinned message. Notifications are always disabled in channels and private chats
    internal let disableNotification: Bool

    /// Identifier of the new pinned message
    internal let messageId: Int64

    /// True, if the message needs to be pinned for one side only; private chats only
    internal let onlyForSelf: Bool

    internal init(
        chatId: Int64,
        disableNotification: Bool,
        messageId: Int64,
        onlyForSelf: Bool
    ) {
        self.chatId = chatId
        self.disableNotification = disableNotification
        self.messageId = messageId
        self.onlyForSelf = onlyForSelf
    }
}
