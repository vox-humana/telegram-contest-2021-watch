//
//  MessageLinkInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a link to a message in a chat
internal struct MessageLinkInfo: Codable {
    /// If found, identifier of the chat to which the message belongs, 0 otherwise
    internal let chatId: Int64

    /// True, if the whole media album to which the message belongs is linked
    internal let forAlbum: Bool

    /// True, if the message is linked as a channel post comment or from a message thread
    internal let forComment: Bool

    /// True, if the link is a public link for a message in a chat
    internal let isPublic: Bool

    /// If found, the linked message; may be null
    internal let message: Message?

    internal init(
        chatId: Int64,
        forAlbum: Bool,
        forComment: Bool,
        isPublic: Bool,
        message: Message?
    ) {
        self.chatId = chatId
        self.forAlbum = forAlbum
        self.forComment = forComment
        self.isPublic = isPublic
        self.message = message
    }
}
