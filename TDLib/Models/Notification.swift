//
//  Notification.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a notification
internal struct Notification: Codable {
    /// Notification date
    internal let date: Int

    /// Unique persistent identifier of this notification
    internal let id: Int

    /// True, if the notification was initially silent
    internal let isSilent: Bool

    /// Notification type
    internal let type: NotificationType

    internal init(
        date: Int,
        id: Int,
        isSilent: Bool,
        type: NotificationType
    ) {
        self.date = date
        self.id = id
        self.isSilent = isSilent
        self.type = type
    }
}
