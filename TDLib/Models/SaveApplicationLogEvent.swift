//
//  SaveApplicationLogEvent.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Saves application log event on the server. Can be called before authorization
internal struct SaveApplicationLogEvent: Codable {
    /// Optional chat identifier, associated with the event
    internal let chatId: Int64

    /// The log event data
    internal let data: JsonValue

    /// Event type
    internal let type: String

    internal init(
        chatId: Int64,
        data: JsonValue,
        type: String
    ) {
        self.chatId = chatId
        self.data = data
        self.type = type
    }
}
