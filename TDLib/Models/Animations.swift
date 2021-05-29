//
//  Animations.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a list of animations
internal struct Animations: Codable {
    /// List of animations
    internal let animations: [Animation]

    internal init(animations: [Animation]) {
        self.animations = animations
    }
}
