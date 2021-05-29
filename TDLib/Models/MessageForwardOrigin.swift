//
//  MessageForwardOrigin.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about the origin of a forwarded message
internal enum MessageForwardOrigin: Codable {
    /// The message was originally sent by a known user
    case messageForwardOriginUser(MessageForwardOriginUser)

    /// The message was originally sent by an anonymous chat administrator on behalf of the chat
    case messageForwardOriginChat(MessageForwardOriginChat)

    /// The message was originally sent by a user, which is hidden by their privacy settings
    case messageForwardOriginHiddenUser(MessageForwardOriginHiddenUser)

    /// The message was originally a post in a channel
    case messageForwardOriginChannel(MessageForwardOriginChannel)

    /// The message was imported from an exported message history
    case messageForwardOriginMessageImport(MessageForwardOriginMessageImport)

    private enum Kind: String, Codable {
        case messageForwardOriginUser
        case messageForwardOriginChat
        case messageForwardOriginHiddenUser
        case messageForwardOriginChannel
        case messageForwardOriginMessageImport
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .messageForwardOriginUser:
            let value = try MessageForwardOriginUser(from: decoder)
            self = .messageForwardOriginUser(value)
        case .messageForwardOriginChat:
            let value = try MessageForwardOriginChat(from: decoder)
            self = .messageForwardOriginChat(value)
        case .messageForwardOriginHiddenUser:
            let value = try MessageForwardOriginHiddenUser(from: decoder)
            self = .messageForwardOriginHiddenUser(value)
        case .messageForwardOriginChannel:
            let value = try MessageForwardOriginChannel(from: decoder)
            self = .messageForwardOriginChannel(value)
        case .messageForwardOriginMessageImport:
            let value = try MessageForwardOriginMessageImport(from: decoder)
            self = .messageForwardOriginMessageImport(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .messageForwardOriginUser(value):
            try container.encode(Kind.messageForwardOriginUser, forKey: .type)
            try value.encode(to: encoder)
        case let .messageForwardOriginChat(value):
            try container.encode(Kind.messageForwardOriginChat, forKey: .type)
            try value.encode(to: encoder)
        case let .messageForwardOriginHiddenUser(value):
            try container.encode(Kind.messageForwardOriginHiddenUser, forKey: .type)
            try value.encode(to: encoder)
        case let .messageForwardOriginChannel(value):
            try container.encode(Kind.messageForwardOriginChannel, forKey: .type)
            try value.encode(to: encoder)
        case let .messageForwardOriginMessageImport(value):
            try container.encode(Kind.messageForwardOriginMessageImport, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// The message was originally sent by a known user
internal struct MessageForwardOriginUser: Codable {
    /// Identifier of the user that originally sent the message
    internal let senderUserId: Int

    internal init(senderUserId: Int) {
        self.senderUserId = senderUserId
    }
}

/// The message was originally sent by an anonymous chat administrator on behalf of the chat
internal struct MessageForwardOriginChat: Codable {
    /// Original message author signature
    internal let authorSignature: String

    /// Identifier of the chat that originally sent the message
    internal let senderChatId: Int64

    internal init(
        authorSignature: String,
        senderChatId: Int64
    ) {
        self.authorSignature = authorSignature
        self.senderChatId = senderChatId
    }
}

/// The message was originally sent by a user, which is hidden by their privacy settings
internal struct MessageForwardOriginHiddenUser: Codable {
    /// Name of the sender
    internal let senderName: String

    internal init(senderName: String) {
        self.senderName = senderName
    }
}

/// The message was originally a post in a channel
internal struct MessageForwardOriginChannel: Codable {
    /// Original post author signature
    internal let authorSignature: String

    /// Identifier of the chat from which the message was originally forwarded
    internal let chatId: Int64

    /// Message identifier of the original message
    internal let messageId: Int64

    internal init(
        authorSignature: String,
        chatId: Int64,
        messageId: Int64
    ) {
        self.authorSignature = authorSignature
        self.chatId = chatId
        self.messageId = messageId
    }
}

/// The message was imported from an exported message history
internal struct MessageForwardOriginMessageImport: Codable {
    /// Name of the sender
    internal let senderName: String

    internal init(senderName: String) {
        self.senderName = senderName
    }
}
