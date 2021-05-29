//
//  ClearAllDraftMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Clears draft messages in all chats
internal struct ClearAllDraftMessages: Codable {
    /// If true, local draft messages in secret chats will not be cleared
    internal let excludeSecretChats: Bool

    internal init(excludeSecretChats: Bool) {
        self.excludeSecretChats = excludeSecretChats
    }
}
