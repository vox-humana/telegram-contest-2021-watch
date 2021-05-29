//
//  CreateCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Creates a new call
internal struct CreateCall: Codable {
    /// True, if a video call needs to be created
    internal let isVideo: Bool

    /// Description of the call protocols supported by the application
    internal let `protocol`: CallProtocol

    /// Identifier of the user to be called
    internal let userId: Int

    internal init(
        isVideo: Bool,
        protocol: CallProtocol,
        userId: Int
    ) {
        self.isVideo = isVideo
        self.protocol = `protocol`
        self.userId = userId
    }
}
