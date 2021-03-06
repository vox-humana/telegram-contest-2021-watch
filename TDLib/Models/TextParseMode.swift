//
//  TextParseMode.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes the way the text should be parsed for TextEntities
internal enum TextParseMode: Codable {
    /// The text uses Markdown-style formatting
    case textParseModeMarkdown(TextParseModeMarkdown)

    /// The text uses HTML-style formatting. The same as Telegram Bot API "HTML" parse mode
    case textParseModeHTML

    private enum Kind: String, Codable {
        case textParseModeMarkdown
        case textParseModeHTML
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .textParseModeMarkdown:
            let value = try TextParseModeMarkdown(from: decoder)
            self = .textParseModeMarkdown(value)
        case .textParseModeHTML:
            self = .textParseModeHTML
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .textParseModeMarkdown(value):
            try container.encode(Kind.textParseModeMarkdown, forKey: .type)
            try value.encode(to: encoder)
        case .textParseModeHTML:
            try container.encode(Kind.textParseModeHTML, forKey: .type)
        }
    }
}

/// The text uses Markdown-style formatting
internal struct TextParseModeMarkdown: Codable {
    /// Version of the parser: 0 or 1 - Telegram Bot API "Markdown" parse mode, 2 - Telegram Bot API "MarkdownV2" parse mode
    internal let version: Int

    internal init(version: Int) {
        self.version = version
    }
}
