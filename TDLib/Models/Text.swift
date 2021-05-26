//
//  Text.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains some text
public struct TextContent: Codable {
    /// Text
    public let text: String

    public init(text: String) {
        self.text = text
    }
}
