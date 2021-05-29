//
//  SetBackground.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the background selected by the user; adds background to the list of installed backgrounds
internal struct SetBackground: Codable {
    /// The input background to use, null for filled backgrounds
    internal let background: InputBackground

    /// True, if the background is chosen for dark theme
    internal let forDarkTheme: Bool

    /// Background type; null for default background. The method will return error 404 if type is null
    internal let type: BackgroundType

    internal init(
        background: InputBackground,
        forDarkTheme: Bool,
        type: BackgroundType
    ) {
        self.background = background
        self.forDarkTheme = forDarkTheme
        self.type = type
    }
}
