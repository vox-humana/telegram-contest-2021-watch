//
//  GroupCallId.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the group call identifier
internal struct GroupCallId: Codable {
    /// Group call identifier
    internal let id: Int

    internal init(id: Int) {
        self.id = id
    }
}
