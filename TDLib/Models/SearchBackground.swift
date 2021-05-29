//
//  SearchBackground.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches for a background by its name
internal struct SearchBackground: Codable {
    /// The name of the background
    internal let name: String

    internal init(name: String) {
        self.name = name
    }
}
