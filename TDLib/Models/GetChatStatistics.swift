//
//  GetChatStatistics.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns detailed statistics about a chat. Currently this method can be used only for supergroups and channels. Can be used only if SupergroupFullInfo.can_get_statistics == true
internal struct GetChatStatistics: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Pass true if a dark theme is used by the application
    internal let isDark: Bool

    internal init(
        chatId: Int64,
        isDark: Bool
    ) {
        self.chatId = chatId
        self.isDark = isDark
    }
}
