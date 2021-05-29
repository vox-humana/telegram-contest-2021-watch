//
//  GetMessageLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns an HTTPS link to a message in a chat. Available only for already sent messages in supergroups and channels. This is an offline request
internal struct GetMessageLink: Codable {
    /// Identifier of the chat to which the message belongs
    internal let chatId: Int64

    /// Pass true to create a link for the whole media album
    internal let forAlbum: Bool

    /// Pass true to create a link to the message as a channel post comment, or from a message thread
    internal let forComment: Bool

    /// Identifier of the message
    internal let messageId: Int64

    internal init(
        chatId: Int64,
        forAlbum: Bool,
        forComment: Bool,
        messageId: Int64
    ) {
        self.chatId = chatId
        self.forAlbum = forAlbum
        self.forComment = forComment
        self.messageId = messageId
    }
}
