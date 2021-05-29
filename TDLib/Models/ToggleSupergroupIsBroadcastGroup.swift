//
//  ToggleSupergroupIsBroadcastGroup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Upgrades supergroup to a broadcast group; requires owner privileges in the supergroup
internal struct ToggleSupergroupIsBroadcastGroup: Codable {
    /// Identifier of the supergroup
    internal let supergroupId: Int

    internal init(supergroupId: Int) {
        self.supergroupId = supergroupId
    }
}
