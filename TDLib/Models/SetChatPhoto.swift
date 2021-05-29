//
//  SetChatPhoto.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can_change_info administrator right
internal struct SetChatPhoto: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New chat photo. Pass null to delete the chat photo
    internal let photo: InputChatPhoto

    internal init(
        chatId: Int64,
        photo: InputChatPhoto
    ) {
        self.chatId = chatId
        self.photo = photo
    }
}
