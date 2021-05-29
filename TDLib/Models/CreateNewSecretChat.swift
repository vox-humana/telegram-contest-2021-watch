//
//  CreateNewSecretChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Creates a new secret chat. Returns the newly created chat
internal struct CreateNewSecretChat: Codable {
    /// Identifier of the target user
    internal let userId: Int

    internal init(userId: Int) {
        self.userId = userId
    }
}
