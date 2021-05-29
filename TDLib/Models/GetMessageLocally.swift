//
//  GetMessageLocally.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a message, if it is available locally without sending network request. This is an offline request
internal struct GetMessageLocally: Codable {
    /// Identifier of the chat the message belongs to
    internal let chatId: Int64

    /// Identifier of the message to get
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.messageId = messageId
    }
}
