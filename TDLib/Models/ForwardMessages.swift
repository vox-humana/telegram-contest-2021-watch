//
//  ForwardMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message
internal struct ForwardMessages: Codable {
    /// Identifier of the chat to which to forward messages
    internal let chatId: Int64

    /// Identifier of the chat from which to forward messages
    internal let fromChatId: Int64

    /// Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously
    internal let messageIds: [Int64]

    /// Options to be used to send the messages
    internal let options: MessageSendOptions

    /// True, if media caption of message copies needs to be removed. Ignored if send_copy is false
    internal let removeCaption: Bool

    /// True, if content of the messages needs to be copied without links to the original messages. Always true if the messages are forwarded to a secret chat
    internal let sendCopy: Bool

    internal init(
        chatId: Int64,
        fromChatId: Int64,
        messageIds: [Int64],
        options: MessageSendOptions,
        removeCaption: Bool,
        sendCopy: Bool
    ) {
        self.chatId = chatId
        self.fromChatId = fromChatId
        self.messageIds = messageIds
        self.options = options
        self.removeCaption = removeCaption
        self.sendCopy = sendCopy
    }
}
