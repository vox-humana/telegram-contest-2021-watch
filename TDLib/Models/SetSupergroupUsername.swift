//
//  SetSupergroupUsername.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the username of a supergroup or channel, requires owner privileges in the supergroup or channel
internal struct SetSupergroupUsername: Codable {
    /// Identifier of the supergroup or channel
    internal let supergroupId: Int

    /// New value of the username. Use an empty string to remove the username
    internal let username: String

    internal init(
        supergroupId: Int,
        username: String
    ) {
        self.supergroupId = supergroupId
        self.username = username
    }
}
