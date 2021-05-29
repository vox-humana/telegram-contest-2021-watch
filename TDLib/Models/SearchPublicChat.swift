//
//  SearchPublicChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Searches a public chat by its username. Currently only private chats, supergroups and channels can be public. Returns the chat if found; otherwise an error is returned
internal struct SearchPublicChat: Codable {
    /// Username to be resolved
    internal let username: String

    internal init(username: String) {
        self.username = username
    }
}
