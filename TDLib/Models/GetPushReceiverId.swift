//
//  GetPushReceiverId.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. Can be called synchronously
internal struct GetPushReceiverId: Codable {
    /// JSON-encoded push notification payload
    internal let payload: String

    internal init(payload: String) {
        self.payload = payload
    }
}
