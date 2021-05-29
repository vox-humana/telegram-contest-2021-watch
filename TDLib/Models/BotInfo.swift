//
//  BotInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Provides information about a bot and its supported commands
internal struct BotInfo: Codable {
    /// A list of commands supported by the bot
    internal let commands: [BotCommand]

    internal let description: String

    internal init(
        commands: [BotCommand],
        description: String
    ) {
        self.commands = commands
        self.description = description
    }
}
