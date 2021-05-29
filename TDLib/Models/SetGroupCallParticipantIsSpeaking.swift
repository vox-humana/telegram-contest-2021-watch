//
//  SetGroupCallParticipantIsSpeaking.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Informs TDLib that a participant of an active group call speaking state has changed
internal struct SetGroupCallParticipantIsSpeaking: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    /// True, if the user is speaking
    internal let isSpeaking: Bool

    /// Group call participant's synchronization source identifier, or 0 for the current user
    internal let source: Int

    internal init(
        groupCallId: Int,
        isSpeaking: Bool,
        source: Int
    ) {
        self.groupCallId = groupCallId
        self.isSpeaking = isSpeaking
        self.source = source
    }
}
