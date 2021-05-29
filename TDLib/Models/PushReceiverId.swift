//
//  PushReceiverId.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a globally unique push receiver identifier, which can be used to identify which account has received a push notification
internal struct PushReceiverId: Codable {
    /// The globally unique identifier of push notification subscription
    internal let id: TdInt64

    internal init(id: TdInt64) {
        self.id = id
    }
}
