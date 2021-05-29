//
//  GetMessageThread.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a message thread. Can be used only if message.can_get_message_thread == true
internal struct GetMessageThread: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Identifier of the message
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.messageId = messageId
    }
}
