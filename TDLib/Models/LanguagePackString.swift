//
//  LanguagePackString.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents one language pack string
internal struct LanguagePackString: Codable {
    /// String key
    internal let key: String

    /// String value
    internal let value: LanguagePackStringValue

    internal init(
        key: String,
        value: LanguagePackStringValue
    ) {
        self.key = key
        self.value = value
    }
}
