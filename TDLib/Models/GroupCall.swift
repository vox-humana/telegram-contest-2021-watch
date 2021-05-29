//
//  GroupCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a group call
internal struct GroupCall: Codable {
    /// True, if the current user can manage the group call
    internal let canBeManaged: Bool

    /// True, if the current user can enable or disable mute_new_participants setting
    internal let canChangeMuteNewParticipants: Bool

    /// Call duration; for ended calls only
    internal let duration: Int

    /// True, if the group call is scheduled and the current user will receive a notification when the group call will start
    internal let enabledStartNotification: Bool

    /// Group call identifier
    internal let id: Int

    /// True, if the call is active
    internal let isActive: Bool

    /// True, if the call is joined
    internal let isJoined: Bool

    /// True, if all group call participants are loaded
    internal let loadedAllParticipants: Bool

    /// True, if only group call administrators can unmute new participants
    internal let muteNewParticipants: Bool

    /// True, if user was kicked from the call because of network loss and the call needs to be rejoined
    internal let needRejoin: Bool

    /// Number of participants in the group call
    internal let participantCount: Int

    /// Recently speaking users in the group call
    internal let recentSpeakers: [GroupCallRecentSpeaker]

    /// Duration of the ongoing group call recording, in seconds; 0 if none. An updateGroupCall update is not triggered when value of this field changes, but the same recording goes on
    internal let recordDuration: Int

    /// Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 if it is already active or was ended
    internal let scheduledStartDate: Int

    /// Group call title
    internal let title: String

    internal init(
        canBeManaged: Bool,
        canChangeMuteNewParticipants: Bool,
        duration: Int,
        enabledStartNotification: Bool,
        id: Int,
        isActive: Bool,
        isJoined: Bool,
        loadedAllParticipants: Bool,
        muteNewParticipants: Bool,
        needRejoin: Bool,
        participantCount: Int,
        recentSpeakers: [GroupCallRecentSpeaker],
        recordDuration: Int,
        scheduledStartDate: Int,
        title: String
    ) {
        self.canBeManaged = canBeManaged
        self.canChangeMuteNewParticipants = canChangeMuteNewParticipants
        self.duration = duration
        self.enabledStartNotification = enabledStartNotification
        self.id = id
        self.isActive = isActive
        self.isJoined = isJoined
        self.loadedAllParticipants = loadedAllParticipants
        self.muteNewParticipants = muteNewParticipants
        self.needRejoin = needRejoin
        self.participantCount = participantCount
        self.recentSpeakers = recentSpeakers
        self.recordDuration = recordDuration
        self.scheduledStartDate = scheduledStartDate
        self.title = title
    }
}
