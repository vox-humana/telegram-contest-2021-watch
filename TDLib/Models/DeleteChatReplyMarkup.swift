//
//  DeleteChatReplyMarkup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a ForceReply reply markup has been used. UpdateChatReplyMarkup will be sent if the reply markup will be changed
internal struct DeleteChatReplyMarkup: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// The message identifier of the used keyboard
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.messageId = messageId
    }
}
