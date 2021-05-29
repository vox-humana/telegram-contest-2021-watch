//
//  Backgrounds.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of backgrounds
internal struct Backgrounds: Codable {
    /// A list of backgrounds
    internal let backgrounds: [Background]

    internal init(backgrounds: [Background]) {
        self.backgrounds = backgrounds
    }
}
