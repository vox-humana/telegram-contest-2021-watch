//
//  RemoveNotification.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes an active notification from notification list. Needs to be called only if the notification is removed by the current user
internal struct RemoveNotification: Codable {
    /// Identifier of notification group to which the notification belongs
    internal let notificationGroupId: Int

    /// Identifier of removed notification
    internal let notificationId: Int

    internal init(
        notificationGroupId: Int,
        notificationId: Int
    ) {
        self.notificationGroupId = notificationGroupId
        self.notificationId = notificationId
    }
}
