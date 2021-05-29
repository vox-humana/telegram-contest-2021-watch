//
//  GroupCallRecentSpeaker.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a recently speaking participant in a group call
internal struct GroupCallRecentSpeaker: Codable {
    /// True, is the user has spoken recently
    internal let isSpeaking: Bool

    /// Group call participant identifier
    internal let participantId: MessageSender

    internal init(
        isSpeaking: Bool,
        participantId: MessageSender
    ) {
        self.isSpeaking = isSpeaking
        self.participantId = participantId
    }
}
