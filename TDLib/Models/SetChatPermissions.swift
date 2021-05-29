//
//  SetChatPermissions.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the chat members permissions. Supported only for basic groups and supergroups. Requires can_restrict_members administrator right
internal struct SetChatPermissions: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New non-administrator members permissions in the chat
    internal let permissions: ChatPermissions

    internal init(
        chatId: Int64,
        permissions: ChatPermissions
    ) {
        self.chatId = chatId
        self.permissions = permissions
    }
}
