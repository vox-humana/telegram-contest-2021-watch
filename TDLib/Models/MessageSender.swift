//
//  MessageSender.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about the sender of a message
internal enum MessageSender: Codable {
    /// The message was sent by a known user
    case messageSenderUser(MessageSenderUser)

    /// The message was sent on behalf of a chat
    case messageSenderChat(MessageSenderChat)

    private enum Kind: String, Codable {
        case messageSenderUser
        case messageSenderChat
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .messageSenderUser:
            let value = try MessageSenderUser(from: decoder)
            self = .messageSenderUser(value)
        case .messageSenderChat:
            let value = try MessageSenderChat(from: decoder)
            self = .messageSenderChat(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .messageSenderUser(value):
            try container.encode(Kind.messageSenderUser, forKey: .type)
            try value.encode(to: encoder)
        case let .messageSenderChat(value):
            try container.encode(Kind.messageSenderChat, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// The message was sent by a known user
internal struct MessageSenderUser: Codable {
    /// Identifier of the user that sent the message
    internal let userId: Int

    internal init(userId: Int) {
        self.userId = userId
    }
}

/// The message was sent on behalf of a chat
internal struct MessageSenderChat: Codable {
    /// Identifier of the chat that sent the message
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
