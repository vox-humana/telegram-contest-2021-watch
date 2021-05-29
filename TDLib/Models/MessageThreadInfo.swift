//
//  MessageThreadInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a message thread
internal struct MessageThreadInfo: Codable {
    /// Identifier of the chat to which the message thread belongs
    internal let chatId: Int64

    /// A draft of a message in the message thread; may be null
    internal let draftMessage: DraftMessage?

    /// Message thread identifier, unique within the chat
    internal let messageThreadId: Int64

    /// The messages from which the thread starts. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id)
    internal let messages: [Message]

    /// Contains information about the message thread
    internal let replyInfo: MessageReplyInfo

    internal init(
        chatId: Int64,
        draftMessage: DraftMessage?,
        messageThreadId: Int64,
        messages: [Message],
        replyInfo: MessageReplyInfo
    ) {
        self.chatId = chatId
        self.draftMessage = draftMessage
        self.messageThreadId = messageThreadId
        self.messages = messages
        self.replyInfo = replyInfo
    }
}
