//
//  CreateSecretChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns an existing chat corresponding to a known secret chat
internal struct CreateSecretChat: Codable {
    /// Secret chat identifier
    internal let secretChatId: Int

    internal init(secretChatId: Int) {
        self.secretChatId = secretChatId
    }
}
