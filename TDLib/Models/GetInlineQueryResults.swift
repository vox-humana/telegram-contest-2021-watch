//
//  GetInlineQueryResults.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires
internal struct GetInlineQueryResults: Codable {
    /// The identifier of the target bot
    internal let botUserId: Int

    /// Identifier of the chat where the query was sent
    internal let chatId: Int64

    /// Offset of the first entry to return
    internal let offset: String

    /// Text of the query
    internal let query: String

    /// Location of the user, only if needed
    internal let userLocation: Location

    internal init(
        botUserId: Int,
        chatId: Int64,
        offset: String,
        query: String,
        userLocation: Location
    ) {
        self.botUserId = botUserId
        self.chatId = chatId
        self.offset = offset
        self.query = query
        self.userLocation = userLocation
    }
}
