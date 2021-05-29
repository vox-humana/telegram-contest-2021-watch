//
//  OpenMessageContent.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Informs TDLib that the message content has been opened (e.g., the user has opened a photo, video, document, location or venue, or has listened to an audio file or voice note message). An updateMessageContentOpened update will be generated if something has changed
internal struct OpenMessageContent: Codable {
    /// Chat identifier of the message
    internal let chatId: Int64

    /// Identifier of the message with the opened content
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.messageId = messageId
    }
}
