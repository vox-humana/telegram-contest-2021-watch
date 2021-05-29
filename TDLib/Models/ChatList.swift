//
//  ChatList.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a list of chats
internal enum ChatList: Codable {
    /// A main list of chats
    case chatListMain

    /// A list of chats usually located at the top of the main chat list. Unmuted chats are automatically moved from the Archive to the Main chat list when a new message arrives
    case chatListArchive

    /// A list of chats belonging to a chat filter
    case chatListFilter(ChatListFilter)

    private enum Kind: String, Codable {
        case chatListMain
        case chatListArchive
        case chatListFilter
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .chatListMain:
            self = .chatListMain
        case .chatListArchive:
            self = .chatListArchive
        case .chatListFilter:
            let value = try ChatListFilter(from: decoder)
            self = .chatListFilter(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .chatListMain:
            try container.encode(Kind.chatListMain, forKey: .type)
        case .chatListArchive:
            try container.encode(Kind.chatListArchive, forKey: .type)
        case let .chatListFilter(value):
            try container.encode(Kind.chatListFilter, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A list of chats belonging to a chat filter
internal struct ChatListFilter: Codable {
    /// Chat filter identifier
    internal let chatFilterId: Int

    internal init(chatFilterId: Int) {
        self.chatFilterId = chatFilterId
    }
}
