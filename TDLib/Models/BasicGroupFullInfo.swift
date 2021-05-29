//
//  BasicGroupFullInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains full information about a basic group
internal struct BasicGroupFullInfo: Codable {
    /// User identifier of the creator of the group; 0 if unknown
    internal let creatorUserId: Int

    internal let description: String

    /// Primary invite link for this group; may be null. For chat administrators with can_invite_users right only. Updated only after the basic group is opened
    internal let inviteLink: ChatInviteLink?

    /// Group members
    internal let members: [ChatMember]

    /// Chat photo; may be null
    internal let photo: ChatPhoto?

    internal init(
        creatorUserId: Int,
        description: String,
        inviteLink: ChatInviteLink?,
        members: [ChatMember],
        photo: ChatPhoto?
    ) {
        self.creatorUserId = creatorUserId
        self.description = description
        self.inviteLink = inviteLink
        self.members = members
        self.photo = photo
    }
}
