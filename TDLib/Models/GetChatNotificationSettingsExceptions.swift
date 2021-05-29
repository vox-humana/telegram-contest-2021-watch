//
//  GetChatNotificationSettingsExceptions.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns list of chats with non-default notification settings
internal struct GetChatNotificationSettingsExceptions: Codable {
    /// If true, also chats with non-default sound will be returned
    internal let compareSound: Bool

    /// If specified, only chats from the specified scope will be returned
    internal let scope: NotificationSettingsScope

    internal init(
        compareSound: Bool,
        scope: NotificationSettingsScope
    ) {
        self.compareSound = compareSound
        self.scope = scope
    }
}
