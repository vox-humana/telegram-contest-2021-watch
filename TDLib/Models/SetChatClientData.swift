//
//  SetChatClientData.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes application-specific data associated with a chat
internal struct SetChatClientData: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New value of client_data
    internal let clientData: String

    internal init(
        chatId: Int64,
        clientData: String
    ) {
        self.chatId = chatId
        self.clientData = clientData
    }
}
