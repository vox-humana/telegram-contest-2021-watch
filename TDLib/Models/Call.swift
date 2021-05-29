//
//  Call.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a call
internal struct Call: Codable {
    /// Call identifier, not persistent
    internal let id: Int

    /// True, if the call is outgoing
    internal let isOutgoing: Bool

    /// True, if the call is a video call
    internal let isVideo: Bool

    /// Call state
    internal let state: CallState

    /// Peer user identifier
    internal let userId: Int

    internal init(
        id: Int,
        isOutgoing: Bool,
        isVideo: Bool,
        state: CallState,
        userId: Int
    ) {
        self.id = id
        self.isOutgoing = isOutgoing
        self.isVideo = isVideo
        self.state = state
        self.userId = userId
    }
}
