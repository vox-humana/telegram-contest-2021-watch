//
//  Game.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a game
internal struct Game: Codable {
    /// Game animation; may be null
    internal let animation: Animation?

    internal let description: String

    /// Game ID
    internal let id: TdInt64

    /// Game photo
    internal let photo: Photo

    /// Game short name. To share a game use the URL https://t.me/{bot_username}?game={game_short_name}
    internal let shortName: String

    /// Game text, usually containing scoreboards for a game
    internal let text: FormattedText

    /// Game title
    internal let title: String

    internal init(
        animation: Animation?,
        description: String,
        id: TdInt64,
        photo: Photo,
        shortName: String,
        text: FormattedText,
        title: String
    ) {
        self.animation = animation
        self.description = description
        self.id = id
        self.photo = photo
        self.shortName = shortName
        self.text = text
        self.title = title
    }
}
