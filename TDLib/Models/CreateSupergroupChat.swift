//
//  CreateSupergroupChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns an existing chat corresponding to a known supergroup or channel
internal struct CreateSupergroupChat: Codable {
    /// If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
    internal let force: Bool

    /// Supergroup or channel identifier
    internal let supergroupId: Int

    internal init(
        force: Bool,
        supergroupId: Int
    ) {
        self.force = force
        self.supergroupId = supergroupId
    }
}
