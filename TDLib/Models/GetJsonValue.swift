//
//  GetJsonValue.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Converts a JSON-serialized string to corresponding JsonValue object. Can be called synchronously
internal struct GetJsonValue: Codable {
    /// The JSON-serialized string
    internal let json: String

    internal init(json: String) {
        self.json = json
    }
}
