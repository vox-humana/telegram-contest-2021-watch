//
//  ChatEventLogFilters.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a set of filters used to obtain a chat event log
internal struct ChatEventLogFilters: Codable {
    /// True, if changes in chat information should be returned
    internal let infoChanges: Bool

    /// True, if changes to invite links should be returned
    internal let inviteLinkChanges: Bool

    /// True, if invited member events should be returned
    internal let memberInvites: Bool

    /// True, if members joining events should be returned
    internal let memberJoins: Bool

    /// True, if members leaving events should be returned
    internal let memberLeaves: Bool

    /// True, if member promotion/demotion events should be returned
    internal let memberPromotions: Bool

    /// True, if member restricted/unrestricted/banned/unbanned events should be returned
    internal let memberRestrictions: Bool

    /// True, if message deletions should be returned
    internal let messageDeletions: Bool

    /// True, if message edits should be returned
    internal let messageEdits: Bool

    /// True, if pin/unpin events should be returned
    internal let messagePins: Bool

    /// True, if changes in chat settings should be returned
    internal let settingChanges: Bool

    /// True, if voice chat actions should be returned
    internal let voiceChatChanges: Bool

    internal init(
        infoChanges: Bool,
        inviteLinkChanges: Bool,
        memberInvites: Bool,
        memberJoins: Bool,
        memberLeaves: Bool,
        memberPromotions: Bool,
        memberRestrictions: Bool,
        messageDeletions: Bool,
        messageEdits: Bool,
        messagePins: Bool,
        settingChanges: Bool,
        voiceChatChanges: Bool
    ) {
        self.infoChanges = infoChanges
        self.inviteLinkChanges = inviteLinkChanges
        self.memberInvites = memberInvites
        self.memberJoins = memberJoins
        self.memberLeaves = memberLeaves
        self.memberPromotions = memberPromotions
        self.memberRestrictions = memberRestrictions
        self.messageDeletions = messageDeletions
        self.messageEdits = messageEdits
        self.messagePins = messagePins
        self.settingChanges = settingChanges
        self.voiceChatChanges = voiceChatChanges
    }
}
