//
//  PublicChatType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a type of public chats
internal enum PublicChatType: Codable {
    /// The chat is public, because it has username
    case publicChatTypeHasUsername

    /// The chat is public, because it is a location-based supergroup
    case publicChatTypeIsLocationBased

    private enum Kind: String, Codable {
        case publicChatTypeHasUsername
        case publicChatTypeIsLocationBased
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .publicChatTypeHasUsername:
            self = .publicChatTypeHasUsername
        case .publicChatTypeIsLocationBased:
            self = .publicChatTypeIsLocationBased
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .publicChatTypeHasUsername:
            try container.encode(Kind.publicChatTypeHasUsername, forKey: .type)
        case .publicChatTypeIsLocationBased:
            try container.encode(Kind.publicChatTypeIsLocationBased, forKey: .type)
        }
    }
}
