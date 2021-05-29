//
//  RevokeGroupCallInviteLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Revokes invite link for a group call. Requires groupCall.can_be_managed group call flag
internal struct RevokeGroupCallInviteLink: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    internal init(groupCallId: Int) {
        self.groupCallId = groupCallId
    }
}
