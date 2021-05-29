//
//  CloseSecretChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Closes a secret chat, effectively transferring its state to secretChatStateClosed
internal struct CloseSecretChat: Codable {
    /// Secret chat identifier
    internal let secretChatId: Int

    internal init(secretChatId: Int) {
        self.secretChatId = secretChatId
    }
}
