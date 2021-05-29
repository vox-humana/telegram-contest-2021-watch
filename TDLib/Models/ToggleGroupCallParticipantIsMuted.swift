//
//  ToggleGroupCallParticipantIsMuted.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Toggles whether a participant of an active group call is muted, unmuted, or allowed to unmute themself
internal struct ToggleGroupCallParticipantIsMuted: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    /// Pass true if the user must be muted and false otherwise
    internal let isMuted: Bool

    /// Participant identifier
    internal let participantId: MessageSender

    internal init(
        groupCallId: Int,
        isMuted: Bool,
        participantId: MessageSender
    ) {
        self.groupCallId = groupCallId
        self.isMuted = isMuted
        self.participantId = participantId
    }
}
