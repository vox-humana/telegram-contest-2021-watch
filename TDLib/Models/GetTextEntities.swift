//
//  GetTextEntities.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns all entities (mentions, hashtags, cashtags, bot commands, bank card numbers, URLs, and email addresses) contained in the text. Can be called synchronously
internal struct GetTextEntities: Codable {
    /// The text in which to look for entites
    internal let text: String

    internal init(text: String) {
        self.text = text
    }
}
