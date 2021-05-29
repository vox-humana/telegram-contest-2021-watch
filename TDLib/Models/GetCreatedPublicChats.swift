//
//  GetCreatedPublicChats.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a list of public chats of the specified type, owned by the user
internal struct GetCreatedPublicChats: Codable {
    /// Type of the public chats to return
    internal let type: PublicChatType

    internal init(type: PublicChatType) {
        self.type = type
    }
}
