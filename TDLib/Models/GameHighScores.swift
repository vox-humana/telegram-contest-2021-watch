//
//  GameHighScores.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of game high scores
internal struct GameHighScores: Codable {
    /// A list of game high scores
    internal let scores: [GameHighScore]

    internal init(scores: [GameHighScore]) {
        self.scores = scores
    }
}
