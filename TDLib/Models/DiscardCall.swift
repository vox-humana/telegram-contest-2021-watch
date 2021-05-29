//
//  DiscardCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Discards a call
internal struct DiscardCall: Codable {
    /// Call identifier
    internal let callId: Int

    /// Identifier of the connection used during the call
    internal let connectionId: TdInt64

    /// The call duration, in seconds
    internal let duration: Int

    /// True, if the user was disconnected
    internal let isDisconnected: Bool

    /// True, if the call was a video call
    internal let isVideo: Bool

    internal init(
        callId: Int,
        connectionId: TdInt64,
        duration: Int,
        isDisconnected: Bool,
        isVideo: Bool
    ) {
        self.callId = callId
        self.connectionId = connectionId
        self.duration = duration
        self.isDisconnected = isDisconnected
        self.isVideo = isVideo
    }
}
