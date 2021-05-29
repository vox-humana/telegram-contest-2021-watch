//
//  GetGroupCallInviteLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns invite link to a voice chat in a public chat
internal struct GetGroupCallInviteLink: Codable {
    /// Pass true if the invite_link should contain an invite hash, passing which to joinGroupCall would allow the invited user to unmute themself. Requires groupCall.can_be_managed group call flag
    internal let canSelfUnmute: Bool

    /// Group call identifier
    internal let groupCallId: Int

    internal init(
        canSelfUnmute: Bool,
        groupCallId: Int
    ) {
        self.canSelfUnmute = canSelfUnmute
        self.groupCallId = groupCallId
    }
}
