//
//  SendCallDebugInformation.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends debug information for a call
internal struct SendCallDebugInformation: Codable {
    /// Call identifier
    internal let callId: Int

    /// Debug information in application-specific format
    internal let debugInformation: String

    internal init(
        callId: Int,
        debugInformation: String
    ) {
        self.callId = callId
        self.debugInformation = debugInformation
    }
}
