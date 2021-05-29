//
//  EditMessageMedia.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits the content of a message with an animation, an audio, a document, a photo or a video. The media in the message can't be replaced if the message was set to self-destruct. Media can't be replaced by self-destructing media. Media in an album can be edited only to contain a photo or a video. Returns the edited message after the edit is completed on the server side
internal struct EditMessageMedia: Codable {
    /// The chat the message belongs to
    internal let chatId: Int64

    /// New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
    internal let inputMessageContent: InputMessageContent

    /// Identifier of the message
    internal let messageId: Int64

    /// The new message reply markup; for bots only
    internal let replyMarkup: ReplyMarkup

    internal init(
        chatId: Int64,
        inputMessageContent: InputMessageContent,
        messageId: Int64,
        replyMarkup: ReplyMarkup
    ) {
        self.chatId = chatId
        self.inputMessageContent = inputMessageContent
        self.messageId = messageId
        self.replyMarkup = replyMarkup
    }
}
