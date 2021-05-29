//
//  GetSupergroupFullInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns full information about a supergroup or a channel by its identifier, cached for up to 1 minute
internal struct GetSupergroupFullInfo: Codable {
    /// Supergroup or channel identifier
    internal let supergroupId: Int

    internal init(supergroupId: Int) {
        self.supergroupId = supergroupId
    }
}
