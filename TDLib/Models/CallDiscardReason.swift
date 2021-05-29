//
//  CallDiscardReason.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes the reason why a call was discarded
internal enum CallDiscardReason: Codable {
    /// The call wasn't discarded, or the reason is unknown
    case callDiscardReasonEmpty

    /// The call was ended before the conversation started. It was cancelled by the caller or missed by the other party
    case callDiscardReasonMissed

    /// The call was ended before the conversation started. It was declined by the other party
    case callDiscardReasonDeclined

    /// The call was ended during the conversation because the users were disconnected
    case callDiscardReasonDisconnected

    /// The call was ended because one of the parties hung up
    case callDiscardReasonHungUp

    private enum Kind: String, Codable {
        case callDiscardReasonEmpty
        case callDiscardReasonMissed
        case callDiscardReasonDeclined
        case callDiscardReasonDisconnected
        case callDiscardReasonHungUp
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .callDiscardReasonEmpty:
            self = .callDiscardReasonEmpty
        case .callDiscardReasonMissed:
            self = .callDiscardReasonMissed
        case .callDiscardReasonDeclined:
            self = .callDiscardReasonDeclined
        case .callDiscardReasonDisconnected:
            self = .callDiscardReasonDisconnected
        case .callDiscardReasonHungUp:
            self = .callDiscardReasonHungUp
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .callDiscardReasonEmpty:
            try container.encode(Kind.callDiscardReasonEmpty, forKey: .type)
        case .callDiscardReasonMissed:
            try container.encode(Kind.callDiscardReasonMissed, forKey: .type)
        case .callDiscardReasonDeclined:
            try container.encode(Kind.callDiscardReasonDeclined, forKey: .type)
        case .callDiscardReasonDisconnected:
            try container.encode(Kind.callDiscardReasonDisconnected, forKey: .type)
        case .callDiscardReasonHungUp:
            try container.encode(Kind.callDiscardReasonHungUp, forKey: .type)
        }
    }
}
