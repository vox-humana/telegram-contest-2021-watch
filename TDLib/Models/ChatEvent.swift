//
//  ChatEvent.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a chat event
internal struct ChatEvent: Codable {
    /// Action performed by the user
    internal let action: ChatEventAction

    /// Point in time (Unix timestamp) when the event happened
    internal let date: Int

    /// Chat event identifier
    internal let id: TdInt64

    /// Identifier of the user who performed the action that triggered the event
    internal let userId: Int

    internal init(
        action: ChatEventAction,
        date: Int,
        id: TdInt64,
        userId: Int
    ) {
        self.action = action
        self.date = date
        self.id = id
        self.userId = userId
    }
}
