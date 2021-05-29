//
//  StartScheduledGroupCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Starts a scheduled group call
internal struct StartScheduledGroupCall: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    internal init(groupCallId: Int) {
        self.groupCallId = groupCallId
    }
}
