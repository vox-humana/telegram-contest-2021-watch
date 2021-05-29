//
//  GetChatMember.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a single member of a chat
internal struct GetChatMember: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Member identifier
    internal let memberId: MessageSender

    internal init(
        chatId: Int64,
        memberId: MessageSender
    ) {
        self.chatId = chatId
        self.memberId = memberId
    }
}
