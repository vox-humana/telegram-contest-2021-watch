//
//  ToggleMessageSenderIsBlocked.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the block state of a message sender. Currently, only users and supergroup chats can be blocked
internal struct ToggleMessageSenderIsBlocked: Codable {
    /// New value of is_blocked
    internal let isBlocked: Bool

    /// Message Sender
    internal let sender: MessageSender

    internal init(
        isBlocked: Bool,
        sender: MessageSender
    ) {
        self.isBlocked = isBlocked
        self.sender = sender
    }
}
