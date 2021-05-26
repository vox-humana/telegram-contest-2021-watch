//
//  ToggleGroupCallEnabledStartNotification.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Toggles whether the current user will receive a notification when the group call will start; scheduled group calls only
public struct ToggleGroupCallEnabledStartNotification: Codable {
    /// New value of the enabled_start_notification setting
    public let enabledStartNotification: Bool

    /// Group call identifier
    public let groupCallId: Int

    public init(
        enabledStartNotification: Bool,
        groupCallId: Int
    ) {
        self.enabledStartNotification = enabledStartNotification
        self.groupCallId = groupCallId
    }
}
