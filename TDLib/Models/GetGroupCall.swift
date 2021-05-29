//
//  GetGroupCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a group call
internal struct GetGroupCall: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    internal init(groupCallId: Int) {
        self.groupCallId = groupCallId
    }
}
