//
//  ScopeNotificationSettings.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about notification settings for several chats
internal struct ScopeNotificationSettings: Codable {
    /// True, if notifications for messages with mentions will be created as for an ordinary unread message
    internal let disableMentionNotifications: Bool

    /// True, if notifications for incoming pinned messages will be created as for an ordinary unread message
    internal let disablePinnedMessageNotifications: Bool

    /// Time left before notifications will be unmuted, in seconds
    internal let muteFor: Int

    /// True, if message content should be displayed in notifications
    internal let showPreview: Bool

    /// The name of an audio file to be used for notification sounds; only applies to iOS applications
    internal let sound: String

    internal init(
        disableMentionNotifications: Bool,
        disablePinnedMessageNotifications: Bool,
        muteFor: Int,
        showPreview: Bool,
        sound: String
    ) {
        self.disableMentionNotifications = disableMentionNotifications
        self.disablePinnedMessageNotifications = disablePinnedMessageNotifications
        self.muteFor = muteFor
        self.showPreview = showPreview
        self.sound = sound
    }
}
