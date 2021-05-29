//
//  GameHighScore.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains one row of the game high score table
internal struct GameHighScore: Codable {
    /// Position in the high score table
    internal let position: Int

    /// User score
    internal let score: Int

    /// User identifier
    internal let userId: Int

    internal init(
        position: Int,
        score: Int,
        userId: Int
    ) {
        self.position = position
        self.score = score
        self.userId = userId
    }
}
