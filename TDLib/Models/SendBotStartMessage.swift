//
//  SendBotStartMessage.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Invites a bot to a chat (if it is not yet a member) and sends it the /start command. Bots can't be invited to a private chat other than the chat with the bot. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message
internal struct SendBotStartMessage: Codable {
    /// Identifier of the bot
    internal let botUserId: Int

    /// Identifier of the target chat
    internal let chatId: Int64

    /// A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking)
    internal let parameter: String

    internal init(
        botUserId: Int,
        chatId: Int64,
        parameter: String
    ) {
        self.botUserId = botUserId
        self.chatId = chatId
        self.parameter = parameter
    }
}
