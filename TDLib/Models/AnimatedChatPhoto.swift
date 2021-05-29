//
//  AnimatedChatPhoto.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Animated variant of a chat photo in MPEG4 format
internal struct AnimatedChatPhoto: Codable {
    /// Information about the animation file
    internal let file: File

    /// Animation width and height
    internal let length: Int

    /// Timestamp of the frame, used as a static chat photo
    internal let mainFrameTimestamp: Double

    internal init(
        file: File,
        length: Int,
        mainFrameTimestamp: Double
    ) {
        self.file = file
        self.length = length
        self.mainFrameTimestamp = mainFrameTimestamp
    }
}
