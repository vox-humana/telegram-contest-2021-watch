//
//  BotCommand.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a command supported by a bot
internal struct BotCommand: Codable {
    /// Text of the bot command
    internal let command: String

    internal let description: String

    internal init(
        command: String,
        description: String
    ) {
        self.command = command
        self.description = description
    }
}
