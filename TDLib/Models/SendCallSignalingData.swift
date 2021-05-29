//
//  SendCallSignalingData.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends call signaling data
internal struct SendCallSignalingData: Codable {
    /// Call identifier
    internal let callId: Int

    /// The data
    internal let data: Data

    internal init(
        callId: Int,
        data: Data
    ) {
        self.callId = callId
        self.data = data
    }
}
