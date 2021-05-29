//
//  Updates.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of updates
internal struct Updates: Codable {
    /// List of updates
    internal let updates: [Update]

    internal init(updates: [Update]) {
        self.updates = updates
    }
}
