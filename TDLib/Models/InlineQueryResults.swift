//
//  InlineQueryResults.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query
internal struct InlineQueryResults: Codable {
    /// Unique identifier of the inline query
    internal let inlineQueryId: TdInt64

    /// The offset for the next request. If empty, there are no more results
    internal let nextOffset: String

    /// Results of the query
    internal let results: [InlineQueryResult]

    /// Parameter for the bot start message
    internal let switchPmParameter: String

    /// If non-empty, this text should be shown on the button, which opens a private chat with the bot and sends the bot a start message with the switch_pm_parameter
    internal let switchPmText: String

    internal init(
        inlineQueryId: TdInt64,
        nextOffset: String,
        results: [InlineQueryResult],
        switchPmParameter: String,
        switchPmText: String
    ) {
        self.inlineQueryId = inlineQueryId
        self.nextOffset = nextOffset
        self.results = results
        self.switchPmParameter = switchPmParameter
        self.switchPmText = switchPmText
    }
}
