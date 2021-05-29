//
//  NotificationGroup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a group of notifications
internal struct NotificationGroup: Codable {
    /// Identifier of a chat to which all notifications in the group belong
    internal let chatId: Int64

    /// Unique persistent auto-incremented from 1 identifier of the notification group
    internal let id: Int

    /// The list of active notifications
    internal let notifications: [Notification]

    /// Total number of active notifications in the group
    internal let totalCount: Int

    /// Type of the group
    internal let type: NotificationGroupType

    internal init(
        chatId: Int64,
        id: Int,
        notifications: [Notification],
        totalCount: Int,
        type: NotificationGroupType
    ) {
        self.chatId = chatId
        self.id = id
        self.notifications = notifications
        self.totalCount = totalCount
        self.type = type
    }
}
