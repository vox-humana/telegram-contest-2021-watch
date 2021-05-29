//
//  ReplacePrimaryChatInviteLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Replaces current primary invite link for a chat with a new primary invite link. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right
internal struct ReplacePrimaryChatInviteLink: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
