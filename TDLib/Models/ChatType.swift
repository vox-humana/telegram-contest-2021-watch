//
//  ChatType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes the type of a chat
internal enum ChatType: Codable {
    /// An ordinary chat with a user
    case chatTypePrivate(ChatTypePrivate)

    /// A basic group (i.e., a chat with 0-200 other users)
    case chatTypeBasicGroup(ChatTypeBasicGroup)

    /// A supergroup (i.e. a chat with up to GetOption("supergroup_max_size") other users), or channel (with unlimited members)
    case chatTypeSupergroup(ChatTypeSupergroup)

    /// A secret chat with a user
    case chatTypeSecret(ChatTypeSecret)

    private enum Kind: String, Codable {
        case chatTypePrivate
        case chatTypeBasicGroup
        case chatTypeSupergroup
        case chatTypeSecret
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .chatTypePrivate:
            let value = try ChatTypePrivate(from: decoder)
            self = .chatTypePrivate(value)
        case .chatTypeBasicGroup:
            let value = try ChatTypeBasicGroup(from: decoder)
            self = .chatTypeBasicGroup(value)
        case .chatTypeSupergroup:
            let value = try ChatTypeSupergroup(from: decoder)
            self = .chatTypeSupergroup(value)
        case .chatTypeSecret:
            let value = try ChatTypeSecret(from: decoder)
            self = .chatTypeSecret(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .chatTypePrivate(value):
            try container.encode(Kind.chatTypePrivate, forKey: .type)
            try value.encode(to: encoder)
        case let .chatTypeBasicGroup(value):
            try container.encode(Kind.chatTypeBasicGroup, forKey: .type)
            try value.encode(to: encoder)
        case let .chatTypeSupergroup(value):
            try container.encode(Kind.chatTypeSupergroup, forKey: .type)
            try value.encode(to: encoder)
        case let .chatTypeSecret(value):
            try container.encode(Kind.chatTypeSecret, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// An ordinary chat with a user
internal struct ChatTypePrivate: Codable {
    /// User identifier
    internal let userId: Int

    internal init(userId: Int) {
        self.userId = userId
    }
}

/// A basic group (i.e., a chat with 0-200 other users)
internal struct ChatTypeBasicGroup: Codable {
    /// Basic group identifier
    internal let basicGroupId: Int

    internal init(basicGroupId: Int) {
        self.basicGroupId = basicGroupId
    }
}

/// A supergroup (i.e. a chat with up to GetOption("supergroup_max_size") other users), or channel (with unlimited members)
internal struct ChatTypeSupergroup: Codable {
    /// True, if the supergroup is a channel
    internal let isChannel: Bool

    /// Supergroup or channel identifier
    internal let supergroupId: Int

    internal init(
        isChannel: Bool,
        supergroupId: Int
    ) {
        self.isChannel = isChannel
        self.supergroupId = supergroupId
    }
}

/// A secret chat with a user
internal struct ChatTypeSecret: Codable {
    /// Secret chat identifier
    internal let secretChatId: Int

    /// User identifier of the secret chat peer
    internal let userId: Int

    internal init(
        secretChatId: Int,
        userId: Int
    ) {
        self.secretChatId = secretChatId
        self.userId = userId
    }
}
