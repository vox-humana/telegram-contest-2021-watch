//
//  MessageFileType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a file with messages exported from another app
internal enum MessageFileType: Codable {
    /// The messages was exported from a private chat
    case messageFileTypePrivate(MessageFileTypePrivate)

    /// The messages was exported from a group chat
    case messageFileTypeGroup(MessageFileTypeGroup)

    /// The messages was exported from a chat of unknown type
    case messageFileTypeUnknown

    private enum Kind: String, Codable {
        case messageFileTypePrivate
        case messageFileTypeGroup
        case messageFileTypeUnknown
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .messageFileTypePrivate:
            let value = try MessageFileTypePrivate(from: decoder)
            self = .messageFileTypePrivate(value)
        case .messageFileTypeGroup:
            let value = try MessageFileTypeGroup(from: decoder)
            self = .messageFileTypeGroup(value)
        case .messageFileTypeUnknown:
            self = .messageFileTypeUnknown
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .messageFileTypePrivate(value):
            try container.encode(Kind.messageFileTypePrivate, forKey: .type)
            try value.encode(to: encoder)
        case let .messageFileTypeGroup(value):
            try container.encode(Kind.messageFileTypeGroup, forKey: .type)
            try value.encode(to: encoder)
        case .messageFileTypeUnknown:
            try container.encode(Kind.messageFileTypeUnknown, forKey: .type)
        }
    }
}

/// The messages was exported from a private chat
internal struct MessageFileTypePrivate: Codable {
    /// Name of the other party; may be empty if unrecognized
    internal let name: String

    internal init(name: String) {
        self.name = name
    }
}

/// The messages was exported from a group chat
internal struct MessageFileTypeGroup: Codable {
    /// Title of the group chat; may be empty if unrecognized
    internal let title: String

    internal init(title: String) {
        self.title = title
    }
}
