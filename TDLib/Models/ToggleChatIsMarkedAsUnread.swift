//
//  ToggleChatIsMarkedAsUnread.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the marked as unread state of a chat
internal struct ToggleChatIsMarkedAsUnread: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New value of is_marked_as_unread
    internal let isMarkedAsUnread: Bool

    internal init(
        chatId: Int64,
        isMarkedAsUnread: Bool
    ) {
        self.chatId = chatId
        self.isMarkedAsUnread = isMarkedAsUnread
    }
}
