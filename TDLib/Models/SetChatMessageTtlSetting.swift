//
//  SetChatMessageTtlSetting.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the message TTL setting (sets a new self-destruct timer) in a chat. Requires can_delete_messages administrator right in basic groups, supergroups and channels Message TTL setting of a chat with the current user (Saved Messages) and the chat 777000 (Telegram) can't be changed
internal struct SetChatMessageTtlSetting: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New TTL value, in seconds; must be one of 0, 86400, 604800 unless chat is secret
    internal let ttl: Int

    internal init(
        chatId: Int64,
        ttl: Int
    ) {
        self.chatId = chatId
        self.ttl = ttl
    }
}
