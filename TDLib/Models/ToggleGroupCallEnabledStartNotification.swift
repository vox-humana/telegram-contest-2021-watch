//
//  ToggleGroupCallEnabledStartNotification.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Toggles whether the current user will receive a notification when the group call will start; scheduled group calls only
internal struct ToggleGroupCallEnabledStartNotification: Codable {
    /// New value of the enabled_start_notification setting
    internal let enabledStartNotification: Bool

    /// Group call identifier
    internal let groupCallId: Int

    internal init(
        enabledStartNotification: Bool,
        groupCallId: Int
    ) {
        self.enabledStartNotification = enabledStartNotification
        self.groupCallId = groupCallId
    }
}
