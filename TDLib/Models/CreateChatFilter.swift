//
//  CreateChatFilter.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Creates new chat filter. Returns information about the created chat filter
internal struct CreateChatFilter: Codable {
    /// Chat filter
    internal let filter: ChatFilter

    internal init(filter: ChatFilter) {
        self.filter = filter
    }
}
