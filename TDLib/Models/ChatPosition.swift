//
//  ChatPosition.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a position of a chat in a chat list
internal struct ChatPosition: Codable {
    /// True, if the chat is pinned in the chat list
    internal let isPinned: Bool

    /// The chat list
    internal let list: ChatList

    /// A parameter used to determine order of the chat in the chat list. Chats must be sorted by the pair (order, chat.id) in descending order
    internal let order: TdInt64

    /// Source of the chat in the chat list; may be null
    internal let source: ChatSource?

    internal init(
        isPinned: Bool,
        list: ChatList,
        order: TdInt64,
        source: ChatSource?
    ) {
        self.isPinned = isPinned
        self.list = list
        self.order = order
        self.source = source
    }
}
