//
//  CallState.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes the current call state
internal enum CallState: Codable {
    /// The call is pending, waiting to be accepted by a user
    case callStatePending(CallStatePending)

    /// The call has been answered and encryption keys are being exchanged
    case callStateExchangingKeys

    /// The call is ready to use
    case callStateReady(CallStateReady)

    /// The call is hanging up after discardCall has been called
    case callStateHangingUp

    /// The call has ended successfully
    case callStateDiscarded(CallStateDiscarded)

    /// The call has ended with an error
    case callStateError(CallStateError)

    private enum Kind: String, Codable {
        case callStatePending
        case callStateExchangingKeys
        case callStateReady
        case callStateHangingUp
        case callStateDiscarded
        case callStateError
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .callStatePending:
            let value = try CallStatePending(from: decoder)
            self = .callStatePending(value)
        case .callStateExchangingKeys:
            self = .callStateExchangingKeys
        case .callStateReady:
            let value = try CallStateReady(from: decoder)
            self = .callStateReady(value)
        case .callStateHangingUp:
            self = .callStateHangingUp
        case .callStateDiscarded:
            let value = try CallStateDiscarded(from: decoder)
            self = .callStateDiscarded(value)
        case .callStateError:
            let value = try CallStateError(from: decoder)
            self = .callStateError(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .callStatePending(value):
            try container.encode(Kind.callStatePending, forKey: .type)
            try value.encode(to: encoder)
        case .callStateExchangingKeys:
            try container.encode(Kind.callStateExchangingKeys, forKey: .type)
        case let .callStateReady(value):
            try container.encode(Kind.callStateReady, forKey: .type)
            try value.encode(to: encoder)
        case .callStateHangingUp:
            try container.encode(Kind.callStateHangingUp, forKey: .type)
        case let .callStateDiscarded(value):
            try container.encode(Kind.callStateDiscarded, forKey: .type)
            try value.encode(to: encoder)
        case let .callStateError(value):
            try container.encode(Kind.callStateError, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// The call is pending, waiting to be accepted by a user
internal struct CallStatePending: Codable {
    /// True, if the call has already been created by the server
    internal let isCreated: Bool

    /// True, if the call has already been received by the other party
    internal let isReceived: Bool

    internal init(
        isCreated: Bool,
        isReceived: Bool
    ) {
        self.isCreated = isCreated
        self.isReceived = isReceived
    }
}

/// The call is ready to use
internal struct CallStateReady: Codable {
    /// True, if peer-to-peer connection is allowed by users privacy settings
    internal let allowP2p: Bool

    /// A JSON-encoded call config
    internal let config: String

    /// Encryption key emojis fingerprint
    internal let emojis: [String]

    /// Call encryption key
    internal let encryptionKey: Data

    /// Call protocols supported by the peer
    internal let `protocol`: CallProtocol

    /// List of available call servers
    internal let servers: [CallServer]

    internal init(
        allowP2p: Bool,
        config: String,
        emojis: [String],
        encryptionKey: Data,
        protocol: CallProtocol,
        servers: [CallServer]
    ) {
        self.allowP2p = allowP2p
        self.config = config
        self.emojis = emojis
        self.encryptionKey = encryptionKey
        self.protocol = `protocol`
        self.servers = servers
    }
}

/// The call has ended successfully
internal struct CallStateDiscarded: Codable {
    /// True, if the call debug information should be sent to the server
    internal let needDebugInformation: Bool

    /// True, if the call rating should be sent to the server
    internal let needRating: Bool

    /// The reason, why the call has ended
    internal let reason: CallDiscardReason

    internal init(
        needDebugInformation: Bool,
        needRating: Bool,
        reason: CallDiscardReason
    ) {
        self.needDebugInformation = needDebugInformation
        self.needRating = needRating
        self.reason = reason
    }
}

/// The call has ended with an error
internal struct CallStateError: Codable {
    /// Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout
    internal let error: Error

    internal init(error: Error) {
        self.error = error
    }
}
