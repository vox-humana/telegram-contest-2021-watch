//
//  ToggleChatDefaultDisableNotification.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the value of the default disable_notification parameter, used when a message is sent to a chat
internal struct ToggleChatDefaultDisableNotification: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// New value of default_disable_notification
    internal let defaultDisableNotification: Bool

    internal init(
        chatId: Int64,
        defaultDisableNotification: Bool
    ) {
        self.chatId = chatId
        self.defaultDisableNotification = defaultDisableNotification
    }
}
