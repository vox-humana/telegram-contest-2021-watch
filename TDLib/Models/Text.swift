//
//  Text.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains some text
internal struct TextContent: Codable {
    /// Text
    internal let text: String

    internal init(text: String) {
        self.text = text
    }
}
