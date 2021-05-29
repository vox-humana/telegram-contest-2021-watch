//
//  SendMessageAlbum.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends 2-10 messages grouped together into an album. Currently only audio, document, photo and video messages can be grouped into an album. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages
internal struct SendMessageAlbum: Codable {
    /// Target chat
    internal let chatId: Int64

    /// Contents of messages to be sent. At most 10 messages can be added to an album
    internal let inputMessageContents: [InputMessageContent]

    /// If not 0, a message thread identifier in which the messages will be sent
    internal let messageThreadId: Int64

    /// Options to be used to send the messages
    internal let options: MessageSendOptions

    /// Identifier of a message to reply to or 0
    internal let replyToMessageId: Int64

    internal init(
        chatId: Int64,
        inputMessageContents: [InputMessageContent],
        messageThreadId: Int64,
        options: MessageSendOptions,
        replyToMessageId: Int64
    ) {
        self.chatId = chatId
        self.inputMessageContents = inputMessageContents
        self.messageThreadId = messageThreadId
        self.options = options
        self.replyToMessageId = replyToMessageId
    }
}
