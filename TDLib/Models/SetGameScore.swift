//
//  SetGameScore.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Updates the game score of the specified user in the game; for bots only
internal struct SetGameScore: Codable {
    /// The chat to which the message with the game belongs
    internal let chatId: Int64

    /// True, if the message should be edited
    internal let editMessage: Bool

    /// Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
    internal let force: Bool

    /// Identifier of the message
    internal let messageId: Int64

    /// The new score
    internal let score: Int

    /// User identifier
    internal let userId: Int

    internal init(
        chatId: Int64,
        editMessage: Bool,
        force: Bool,
        messageId: Int64,
        score: Int,
        userId: Int
    ) {
        self.chatId = chatId
        self.editMessage = editMessage
        self.force = force
        self.messageId = messageId
        self.score = score
        self.userId = userId
    }
}
