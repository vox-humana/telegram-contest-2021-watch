//
//  GetChatFilter.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a chat filter by its identifier
internal struct GetChatFilter: Codable {
    /// Chat filter identifier
    internal let chatFilterId: Int

    internal init(chatFilterId: Int) {
        self.chatFilterId = chatFilterId
    }
}
