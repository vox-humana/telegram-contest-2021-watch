//
//  ParseMarkdown.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously
internal struct ParseMarkdown: Codable {
    /// The text to parse. For example, "__italic__ ~~strikethrough~~ **bold** `code` ```pre``` __[italic__ text_url](telegram.org) __italic**bold italic__bold**"
    internal let text: FormattedText

    internal init(text: FormattedText) {
        self.text = text
    }
}
