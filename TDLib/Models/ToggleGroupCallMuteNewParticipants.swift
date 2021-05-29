//
//  ToggleGroupCallMuteNewParticipants.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Toggles whether new participants of a group call can be unmuted only by administrators of the group call. Requires groupCall.can_change_mute_new_participants group call flag
internal struct ToggleGroupCallMuteNewParticipants: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    /// New value of the mute_new_participants setting
    internal let muteNewParticipants: Bool

    internal init(
        groupCallId: Int,
        muteNewParticipants: Bool
    ) {
        self.groupCallId = groupCallId
        self.muteNewParticipants = muteNewParticipants
    }
}
