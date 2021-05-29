//
//  GetGroupCallStreamSegment.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a file with a segment of a group call stream in a modified OGG format
internal struct GetGroupCallStreamSegment: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    /// Segment duration scale; 0-1. Segment's duration is 1000/(2**scale) milliseconds
    internal let scale: Int

    /// Point in time when the stream segment begins; Unix timestamp in milliseconds
    internal let timeOffset: Int64

    internal init(
        groupCallId: Int,
        scale: Int,
        timeOffset: Int64
    ) {
        self.groupCallId = groupCallId
        self.scale = scale
        self.timeOffset = timeOffset
    }
}
