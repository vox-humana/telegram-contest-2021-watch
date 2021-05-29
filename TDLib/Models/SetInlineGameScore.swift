//
//  SetInlineGameScore.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Updates the game score of the specified user in a game; for bots only
internal struct SetInlineGameScore: Codable {
    /// True, if the message should be edited
    internal let editMessage: Bool

    /// Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
    internal let force: Bool

    /// Inline message identifier
    internal let inlineMessageId: String

    /// The new score
    internal let score: Int

    /// User identifier
    internal let userId: Int

    internal init(
        editMessage: Bool,
        force: Bool,
        inlineMessageId: String,
        score: Int,
        userId: Int
    ) {
        self.editMessage = editMessage
        self.force = force
        self.inlineMessageId = inlineMessageId
        self.score = score
        self.userId = userId
    }
}
