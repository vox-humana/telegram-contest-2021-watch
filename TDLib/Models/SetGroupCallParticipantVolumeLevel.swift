//
//  SetGroupCallParticipantVolumeLevel.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes volume level of a participant of an active group call. If the current user can manage the group call, then the participant's volume level will be changed for all users with default volume level
internal struct SetGroupCallParticipantVolumeLevel: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    /// Participant identifier
    internal let participantId: MessageSender

    /// New participant's volume level; 1-20000 in hundreds of percents
    internal let volumeLevel: Int

    internal init(
        groupCallId: Int,
        participantId: MessageSender,
        volumeLevel: Int
    ) {
        self.groupCallId = groupCallId
        self.participantId = participantId
        self.volumeLevel = volumeLevel
    }
}
