//
//  SetBotUpdatesStatus.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only
internal struct SetBotUpdatesStatus: Codable {
    /// The last error message
    internal let errorMessage: String

    /// The number of pending updates
    internal let pendingUpdateCount: Int

    internal init(
        errorMessage: String,
        pendingUpdateCount: Int
    ) {
        self.errorMessage = errorMessage
        self.pendingUpdateCount = pendingUpdateCount
    }
}
