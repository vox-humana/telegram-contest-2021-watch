//
//  ToggleSupergroupSignMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Toggles sender signatures messages sent in a channel; requires can_change_info administrator right
internal struct ToggleSupergroupSignMessages: Codable {
    /// New value of sign_messages
    internal let signMessages: Bool

    /// Identifier of the channel
    internal let supergroupId: Int

    internal init(
        signMessages: Bool,
        supergroupId: Int
    ) {
        self.signMessages = signMessages
        self.supergroupId = supergroupId
    }
}
