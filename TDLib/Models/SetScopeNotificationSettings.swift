//
//  SetScopeNotificationSettings.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes notification settings for chats of a given type
internal struct SetScopeNotificationSettings: Codable {
    /// The new notification settings for the given scope
    internal let notificationSettings: ScopeNotificationSettings

    /// Types of chats for which to change the notification settings
    internal let scope: NotificationSettingsScope

    internal init(
        notificationSettings: ScopeNotificationSettings,
        scope: NotificationSettingsScope
    ) {
        self.notificationSettings = notificationSettings
        self.scope = scope
    }
}
