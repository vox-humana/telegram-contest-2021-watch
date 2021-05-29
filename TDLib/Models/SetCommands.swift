//
//  SetCommands.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets the list of commands supported by the bot; for bots only
internal struct SetCommands: Codable {
    /// List of the bot's commands
    internal let commands: [BotCommand]

    internal init(commands: [BotCommand]) {
        self.commands = commands
    }
}
