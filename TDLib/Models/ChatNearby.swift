//
//  ChatNearby.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a chat located nearby
internal struct ChatNearby: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Distance to the chat location, in meters
    internal let distance: Int

    internal init(
        chatId: Int64,
        distance: Int
    ) {
        self.chatId = chatId
        self.distance = distance
    }
}
