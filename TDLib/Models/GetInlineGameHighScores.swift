//
//  GetInlineGameHighScores.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns game high scores and some part of the high score table in the range of the specified user; for bots only
internal struct GetInlineGameHighScores: Codable {
    /// Inline message identifier
    internal let inlineMessageId: String

    /// User identifier
    internal let userId: Int

    internal init(
        inlineMessageId: String,
        userId: Int
    ) {
        self.inlineMessageId = inlineMessageId
        self.userId = userId
    }
}
