//
//  DeleteChatFilter.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes existing chat filter
internal struct DeleteChatFilter: Codable {
    /// Chat filter identifier
    internal let chatFilterId: Int

    internal init(chatFilterId: Int) {
        self.chatFilterId = chatFilterId
    }
}
