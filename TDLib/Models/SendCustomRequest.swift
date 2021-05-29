//
//  SendCustomRequest.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends a custom request; for bots only
internal struct SendCustomRequest: Codable {
    /// The method name
    internal let method: String

    /// JSON-serialized method parameters
    internal let parameters: String

    internal init(
        method: String,
        parameters: String
    ) {
        self.method = method
        self.parameters = parameters
    }
}
