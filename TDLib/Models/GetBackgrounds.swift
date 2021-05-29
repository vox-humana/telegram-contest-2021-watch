//
//  GetBackgrounds.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns backgrounds installed by the user
internal struct GetBackgrounds: Codable {
    /// True, if the backgrounds must be ordered for dark theme
    internal let forDarkTheme: Bool

    internal init(forDarkTheme: Bool) {
        self.forDarkTheme = forDarkTheme
    }
}
