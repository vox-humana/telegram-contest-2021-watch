//
//  RemoveSavedAnimation.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes an animation from the list of saved animations
internal struct RemoveSavedAnimation: Codable {
    /// Animation file to be removed
    internal let animation: InputFile

    internal init(animation: InputFile) {
        self.animation = animation
    }
}
