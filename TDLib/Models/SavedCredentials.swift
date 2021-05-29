//
//  SavedCredentials.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about saved card credentials
internal struct SavedCredentials: Codable {
    /// Unique identifier of the saved credentials
    internal let id: String

    /// Title of the saved credentials
    internal let title: String

    internal init(
        id: String,
        title: String
    ) {
        self.id = id
        self.title = title
    }
}
