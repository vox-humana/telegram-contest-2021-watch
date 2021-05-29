//
//  ChatLists.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of chat lists
internal struct ChatLists: Codable {
    /// List of chat lists
    internal let chatLists: [ChatList]

    internal init(chatLists: [ChatList]) {
        self.chatLists = chatLists
    }
}
