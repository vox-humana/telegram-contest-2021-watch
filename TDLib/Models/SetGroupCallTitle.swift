//
//  SetGroupCallTitle.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets group call title. Requires groupCall.can_be_managed group call flag
internal struct SetGroupCallTitle: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    /// New group call title; 1-64 characters
    internal let title: String

    internal init(
        groupCallId: Int,
        title: String
    ) {
        self.groupCallId = groupCallId
        self.title = title
    }
}
