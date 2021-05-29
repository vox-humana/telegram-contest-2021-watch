//
//  Emojis.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a list of emoji
internal struct Emojis: Codable {
    /// List of emojis
    internal let emojis: [String]

    internal init(emojis: [String]) {
        self.emojis = emojis
    }
}
