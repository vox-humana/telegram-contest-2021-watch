//
//  EndGroupCallRecording.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Ends recording of an active group call. Requires groupCall.can_be_managed group call flag
internal struct EndGroupCallRecording: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    internal init(groupCallId: Int) {
        self.groupCallId = groupCallId
    }
}
