//
//  ParseTextEntities.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Parses Bold, Italic, Underline, Strikethrough, Code, Pre, PreCode, TextUrl and MentionName entities contained in the text. Can be called synchronously
internal struct ParseTextEntities: Codable {
    /// Text parse mode
    internal let parseMode: TextParseMode

    /// The text to parse
    internal let text: String

    internal init(
        parseMode: TextParseMode,
        text: String
    ) {
        self.parseMode = parseMode
        self.text = text
    }
}
