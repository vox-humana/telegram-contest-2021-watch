//
//  RegisterDevice.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Registers the currently used device for receiving push notifications. Returns a globally unique identifier of the push notification subscription
internal struct RegisterDevice: Codable {
    /// Device token
    internal let deviceToken: DeviceToken

    /// List of user identifiers of other users currently using the application
    internal let otherUserIds: [Int]

    internal init(
        deviceToken: DeviceToken,
        otherUserIds: [Int]
    ) {
        self.deviceToken = deviceToken
        self.otherUserIds = otherUserIds
    }
}
