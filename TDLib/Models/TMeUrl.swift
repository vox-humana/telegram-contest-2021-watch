//
//  TMeUrl.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a URL linking to an internal Telegram entity
internal struct TMeUrl: Codable {
    /// Type of the URL
    internal let type: TMeUrlType

    /// URL
    internal let url: String

    internal init(
        type: TMeUrlType,
        url: String
    ) {
        self.type = type
        self.url = url
    }
}
