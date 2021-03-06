//
//  AnswerInlineQuery.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets the result of an inline query; for bots only
internal struct AnswerInlineQuery: Codable {
    /// Allowed time to cache the results of the query, in seconds
    internal let cacheTime: Int

    /// Identifier of the inline query
    internal let inlineQueryId: TdInt64

    /// True, if the result of the query can be cached for the specified user
    internal let isPersonal: Bool

    /// Offset for the next inline query; pass an empty string if there are no more results
    internal let nextOffset: String

    /// The results of the query
    internal let results: [InputInlineQueryResult]

    /// The parameter for the bot start message
    internal let switchPmParameter: String

    /// If non-empty, this text should be shown on the button that opens a private chat with the bot and sends a start message to the bot with the parameter switch_pm_parameter
    internal let switchPmText: String

    internal init(
        cacheTime: Int,
        inlineQueryId: TdInt64,
        isPersonal: Bool,
        nextOffset: String,
        results: [InputInlineQueryResult],
        switchPmParameter: String,
        switchPmText: String
    ) {
        self.cacheTime = cacheTime
        self.inlineQueryId = inlineQueryId
        self.isPersonal = isPersonal
        self.nextOffset = nextOffset
        self.results = results
        self.switchPmParameter = switchPmParameter
        self.switchPmText = switchPmText
    }
}
