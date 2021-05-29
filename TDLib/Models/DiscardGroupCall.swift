//
//  DiscardGroupCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Discards a group call. Requires groupCall.can_be_managed
internal struct DiscardGroupCall: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    internal init(groupCallId: Int) {
        self.groupCallId = groupCallId
    }
}
