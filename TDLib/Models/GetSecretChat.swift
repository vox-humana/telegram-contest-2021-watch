//
//  GetSecretChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a secret chat by its identifier. This is an offline request
internal struct GetSecretChat: Codable {
    /// Secret chat identifier
    internal let secretChatId: Int

    internal init(secretChatId: Int) {
        self.secretChatId = secretChatId
    }
}
