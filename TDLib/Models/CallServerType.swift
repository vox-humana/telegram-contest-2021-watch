//
//  CallServerType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes the type of a call server
internal enum CallServerType: Codable {
    /// A Telegram call reflector
    case callServerTypeTelegramReflector(CallServerTypeTelegramReflector)

    /// A WebRTC server
    case callServerTypeWebrtc(CallServerTypeWebrtc)

    private enum Kind: String, Codable {
        case callServerTypeTelegramReflector
        case callServerTypeWebrtc
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .callServerTypeTelegramReflector:
            let value = try CallServerTypeTelegramReflector(from: decoder)
            self = .callServerTypeTelegramReflector(value)
        case .callServerTypeWebrtc:
            let value = try CallServerTypeWebrtc(from: decoder)
            self = .callServerTypeWebrtc(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .callServerTypeTelegramReflector(value):
            try container.encode(Kind.callServerTypeTelegramReflector, forKey: .type)
            try value.encode(to: encoder)
        case let .callServerTypeWebrtc(value):
            try container.encode(Kind.callServerTypeWebrtc, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A Telegram call reflector
internal struct CallServerTypeTelegramReflector: Codable {
    /// A peer tag to be used with the reflector
    internal let peerTag: Data

    internal init(peerTag: Data) {
        self.peerTag = peerTag
    }
}

/// A WebRTC server
internal struct CallServerTypeWebrtc: Codable {
    /// Authentication password
    internal let password: String

    /// True, if the server supports STUN
    internal let supportsStun: Bool

    /// True, if the server supports TURN
    internal let supportsTurn: Bool

    /// Username to be used for authentication
    internal let username: String

    internal init(
        password: String,
        supportsStun: Bool,
        supportsTurn: Bool,
        username: String
    ) {
        self.password = password
        self.supportsStun = supportsStun
        self.supportsTurn = supportsTurn
        self.username = username
    }
}
