//
//  JsonObjectMember.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents one member of a JSON object
internal struct JsonObjectMember: Codable {
    /// Member's key
    internal let key: String

    /// Member's value
    internal let value: JsonValue

    internal init(
        key: String,
        value: JsonValue
    ) {
        self.key = key
        self.value = value
    }
}
