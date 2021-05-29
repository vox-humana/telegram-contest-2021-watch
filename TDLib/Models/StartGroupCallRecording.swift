//
//  StartGroupCallRecording.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Starts recording of an active group call. Requires groupCall.can_be_managed group call flag
internal struct StartGroupCallRecording: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    /// Group call recording title; 0-64 characters
    internal let title: String

    internal init(
        groupCallId: Int,
        title: String
    ) {
        self.groupCallId = groupCallId
        self.title = title
    }
}
