//
//  SetChatDraftMessage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the draft message in a chat
internal struct SetChatDraftMessage: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New draft message; may be null
    internal let draftMessage: DraftMessage?

    /// If not 0, a message thread identifier in which the draft was changed
    internal let messageThreadId: Int64

    internal init(
        chatId: Int64,
        draftMessage: DraftMessage?,
        messageThreadId: Int64
    ) {
        self.chatId = chatId
        self.draftMessage = draftMessage
        self.messageThreadId = messageThreadId
    }
}
