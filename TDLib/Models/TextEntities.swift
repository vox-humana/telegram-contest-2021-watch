//
//  TextEntities.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of text entities
internal struct TextEntities: Codable {
    /// List of text entities
    internal let entities: [TextEntity]

    internal init(entities: [TextEntity]) {
        self.entities = entities
    }
}
