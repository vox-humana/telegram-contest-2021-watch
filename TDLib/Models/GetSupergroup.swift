//
//  GetSupergroup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a supergroup or a channel by its identifier. This is an offline request if the current user is not a bot
internal struct GetSupergroup: Codable {
    /// Supergroup or channel identifier
    internal let supergroupId: Int

    internal init(supergroupId: Int) {
        self.supergroupId = supergroupId
    }
}
