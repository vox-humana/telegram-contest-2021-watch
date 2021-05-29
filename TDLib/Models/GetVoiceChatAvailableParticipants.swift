//
//  GetVoiceChatAvailableParticipants.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns list of participant identifiers, which can be used to join voice chats in a chat
internal struct GetVoiceChatAvailableParticipants: Codable {
    /// Chat identifier
    internal let chatId: Int64

    internal init(chatId: Int64) {
        self.chatId = chatId
    }
}
