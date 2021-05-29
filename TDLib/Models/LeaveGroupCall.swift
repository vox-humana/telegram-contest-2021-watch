//
//  LeaveGroupCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Leaves a group call
internal struct LeaveGroupCall: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    internal init(groupCallId: Int) {
        self.groupCallId = groupCallId
    }
}
