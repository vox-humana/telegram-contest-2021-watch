//
//  EditMessageSchedulingState.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits the time when a scheduled message will be sent. Scheduling state of all messages in the same album or forwarded together with the message will be also changed
internal struct EditMessageSchedulingState: Codable {
    /// The chat the message belongs to
    internal let chatId: Int64

    /// Identifier of the message
    internal let messageId: Int64

    /// The new message scheduling state. Pass null to send the message immediately
    internal let schedulingState: MessageSchedulingState

    internal init(
        chatId: Int64,
        messageId: Int64,
        schedulingState: MessageSchedulingState
    ) {
        self.chatId = chatId
        self.messageId = messageId
        self.schedulingState = schedulingState
    }
}
