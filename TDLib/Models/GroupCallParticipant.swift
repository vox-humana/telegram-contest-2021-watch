//
//  GroupCallParticipant.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a group call participant
internal struct GroupCallParticipant: Codable {
    /// The participant user's bio or the participant chat's description
    internal let bio: String

    /// True, if the current user can mute the participant for all other group call participants
    internal let canBeMutedForAllUsers: Bool

    /// True, if the current user can mute the participant only for self
    internal let canBeMutedForCurrentUser: Bool

    /// True, if the current user can allow the participant to unmute themself or unmute the participant (if the participant is the current user)
    internal let canBeUnmutedForAllUsers: Bool

    /// True, if the current user can unmute the participant for self
    internal let canBeUnmutedForCurrentUser: Bool

    /// True, if the participant is muted for all users, but can unmute themself
    internal let canUnmuteSelf: Bool

    /// True, if the participant is the current user
    internal let isCurrentUser: Bool

    /// True, if the participant hand is raised
    internal let isHandRaised: Bool

    /// True, if the participant is muted for all users
    internal let isMutedForAllUsers: Bool

    /// True, if the participant is muted for the current user
    internal let isMutedForCurrentUser: Bool

    /// True, if the participant is speaking as set by setGroupCallParticipantIsSpeaking
    internal let isSpeaking: Bool

    /// User's order in the group call participant list. Orders must be compared lexicographically. The bigger is order, the higher is user in the list. If order is empty, the user must be removed from the participant list
    internal let order: String

    /// Identifier of the group call participant
    internal let participantId: MessageSender

    /// User's synchronization source
    internal let source: Int

    /// Participant's volume level; 1-20000 in hundreds of percents
    internal let volumeLevel: Int

    internal init(
        bio: String,
        canBeMutedForAllUsers: Bool,
        canBeMutedForCurrentUser: Bool,
        canBeUnmutedForAllUsers: Bool,
        canBeUnmutedForCurrentUser: Bool,
        canUnmuteSelf: Bool,
        isCurrentUser: Bool,
        isHandRaised: Bool,
        isMutedForAllUsers: Bool,
        isMutedForCurrentUser: Bool,
        isSpeaking: Bool,
        order: String,
        participantId: MessageSender,
        source: Int,
        volumeLevel: Int
    ) {
        self.bio = bio
        self.canBeMutedForAllUsers = canBeMutedForAllUsers
        self.canBeMutedForCurrentUser = canBeMutedForCurrentUser
        self.canBeUnmutedForAllUsers = canBeUnmutedForAllUsers
        self.canBeUnmutedForCurrentUser = canBeUnmutedForCurrentUser
        self.canUnmuteSelf = canUnmuteSelf
        self.isCurrentUser = isCurrentUser
        self.isHandRaised = isHandRaised
        self.isMutedForAllUsers = isMutedForAllUsers
        self.isMutedForCurrentUser = isMutedForCurrentUser
        self.isSpeaking = isSpeaking
        self.order = order
        self.participantId = participantId
        self.source = source
        self.volumeLevel = volumeLevel
    }
}
