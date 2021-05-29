//
//  GroupCallJoinResponse.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a group call join response
internal enum GroupCallJoinResponse: Codable {
    /// Contains data needed to join the group call with WebRTC
    case groupCallJoinResponseWebrtc(GroupCallJoinResponseWebrtc)

    /// Describes that group call needs to be joined as a stream
    case groupCallJoinResponseStream

    private enum Kind: String, Codable {
        case groupCallJoinResponseWebrtc
        case groupCallJoinResponseStream
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .groupCallJoinResponseWebrtc:
            let value = try GroupCallJoinResponseWebrtc(from: decoder)
            self = .groupCallJoinResponseWebrtc(value)
        case .groupCallJoinResponseStream:
            self = .groupCallJoinResponseStream
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .groupCallJoinResponseWebrtc(value):
            try container.encode(Kind.groupCallJoinResponseWebrtc, forKey: .type)
            try value.encode(to: encoder)
        case .groupCallJoinResponseStream:
            try container.encode(Kind.groupCallJoinResponseStream, forKey: .type)
        }
    }
}

/// Contains data needed to join the group call with WebRTC
internal struct GroupCallJoinResponseWebrtc: Codable {
    /// Join response candidates to pass to tgcalls
    internal let candidates: [GroupCallJoinResponseCandidate]

    /// Group call payload to pass to tgcalls
    internal let payload: GroupCallPayload

    internal init(
        candidates: [GroupCallJoinResponseCandidate],
        payload: GroupCallPayload
    ) {
        self.candidates = candidates
        self.payload = payload
    }
}
