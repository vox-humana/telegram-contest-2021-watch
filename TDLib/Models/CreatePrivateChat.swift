//
//  CreatePrivateChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns an existing chat corresponding to a given user
internal struct CreatePrivateChat: Codable {
    /// If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
    internal let force: Bool

    /// User identifier
    internal let userId: Int

    internal init(
        force: Bool,
        userId: Int
    ) {
        self.force = force
        self.userId = userId
    }
}
