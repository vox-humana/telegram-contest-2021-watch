//
//  AnswerCustomQuery.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Answers a custom query; for bots only
internal struct AnswerCustomQuery: Codable {
    /// Identifier of a custom query
    internal let customQueryId: TdInt64

    /// JSON-serialized answer to the query
    internal let data: String

    internal init(
        customQueryId: TdInt64,
        data: String
    ) {
        self.customQueryId = customQueryId
        self.data = data
    }
}
