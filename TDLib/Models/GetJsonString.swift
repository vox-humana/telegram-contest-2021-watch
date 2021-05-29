//
//  GetJsonString.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Converts a JsonValue object to corresponding JSON-serialized string. Can be called synchronously
internal struct GetJsonString: Codable {
    /// The JsonValue object
    internal let jsonValue: JsonValue

    internal init(jsonValue: JsonValue) {
        self.jsonValue = jsonValue
    }
}
