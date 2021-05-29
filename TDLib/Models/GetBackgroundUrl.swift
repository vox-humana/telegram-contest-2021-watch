//
//  GetBackgroundUrl.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Constructs a persistent HTTP URL for a background
internal struct GetBackgroundUrl: Codable {
    /// Background name
    internal let name: String

    /// Background type
    internal let type: BackgroundType

    internal init(
        name: String,
        type: BackgroundType
    ) {
        self.name = name
        self.type = type
    }
}
