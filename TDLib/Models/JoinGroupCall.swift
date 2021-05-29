//
//  JoinGroupCall.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Joins an active group call
internal struct JoinGroupCall: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    /// If non-empty, invite hash to be used to join the group call without being muted by administrators
    internal let inviteHash: String

    /// True, if the user's microphone is muted
    internal let isMuted: Bool

    /// Identifier of a group call participant, which will be used to join the call; voice chats only
    internal let participantId: MessageSender

    /// Group join payload; received from tgcalls
    internal let payload: GroupCallPayload

    /// Caller synchronization source identifier; received from tgcalls
    internal let source: Int

    internal init(
        groupCallId: Int,
        inviteHash: String,
        isMuted: Bool,
        participantId: MessageSender,
        payload: GroupCallPayload,
        source: Int
    ) {
        self.groupCallId = groupCallId
        self.inviteHash = inviteHash
        self.isMuted = isMuted
        self.participantId = participantId
        self.payload = payload
        self.source = source
    }
}
