//
//  AcceptCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Accepts an incoming call
internal struct AcceptCall: Codable {
    /// Call identifier
    internal let callId: Int

    /// Description of the call protocols supported by the application
    internal let `protocol`: CallProtocol

    internal init(
        callId: Int,
        protocol: CallProtocol
    ) {
        self.callId = callId
        self.protocol = `protocol`
    }
}
