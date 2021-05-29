//
//  EditChatFilter.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits existing chat filter. Returns information about the edited chat filter
internal struct EditChatFilter: Codable {
    /// Chat filter identifier
    internal let chatFilterId: Int

    /// The edited chat filter
    internal let filter: ChatFilter

    internal init(
        chatFilterId: Int,
        filter: ChatFilter
    ) {
        self.chatFilterId = chatFilterId
        self.filter = filter
    }
}
