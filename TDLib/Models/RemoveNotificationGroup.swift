//
//  RemoveNotificationGroup.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes a group of active notifications. Needs to be called only if the notification group is removed by the current user
internal struct RemoveNotificationGroup: Codable {
    /// The maximum identifier of removed notifications
    internal let maxNotificationId: Int

    /// Notification group identifier
    internal let notificationGroupId: Int

    internal init(
        maxNotificationId: Int,
        notificationGroupId: Int
    ) {
        self.maxNotificationId = maxNotificationId
        self.notificationGroupId = notificationGroupId
    }
}
