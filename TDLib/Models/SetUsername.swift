//
//  SetUsername.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the username of the current user
internal struct SetUsername: Codable {
    /// The new value of the username. Use an empty string to remove the username
    internal let username: String

    internal init(username: String) {
        self.username = username
    }
}
