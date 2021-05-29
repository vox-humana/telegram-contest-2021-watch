//
//  GetChatStatisticsUrl.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns an HTTP URL with the chat statistics. Currently this method of getting the statistics are disabled and can be deleted in the future
internal struct GetChatStatisticsUrl: Codable {
    /// Chat identifier
    internal let chatId: Int64

    /// Pass true if a URL with the dark theme must be returned
    internal let isDark: Bool

    /// Parameters from "tg://statsrefresh?params=******" link
    internal let parameters: String

    internal init(
        chatId: Int64,
        isDark: Bool,
        parameters: String
    ) {
        self.chatId = chatId
        self.isDark = isDark
        self.parameters = parameters
    }
}
