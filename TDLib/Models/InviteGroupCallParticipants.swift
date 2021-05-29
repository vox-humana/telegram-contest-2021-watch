//
//  InviteGroupCallParticipants.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Invites users to an active group call. Sends a service message of type messageInviteToGroupCall for voice chats
internal struct InviteGroupCallParticipants: Codable {
    /// Group call identifier
    internal let groupCallId: Int

    /// User identifiers. At most 10 users can be invited simultaneously
    internal let userIds: [Int]

    internal init(
        groupCallId: Int,
        userIds: [Int]
    ) {
        self.groupCallId = groupCallId
        self.userIds = userIds
    }
}
