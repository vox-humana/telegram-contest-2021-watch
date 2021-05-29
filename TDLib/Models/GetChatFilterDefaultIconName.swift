//
//  GetChatFilterDefaultIconName.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns default icon name for a filter. Can be called synchronously
internal struct GetChatFilterDefaultIconName: Codable {
    /// Chat filter
    internal let filter: ChatFilter

    internal init(filter: ChatFilter) {
        self.filter = filter
    }
}
