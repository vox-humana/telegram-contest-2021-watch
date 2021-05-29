//
//  CallId.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the call identifier
internal struct CallId: Codable {
    /// Call identifier
    internal let id: Int

    internal init(id: Int) {
        self.id = id
    }
}
