//
//  BasicGroupFullInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains full information about a basic group
public struct BasicGroupFullInfo: Codable {
    /// User identifier of the creator of the group; 0 if unknown
    public let creatorUserId: Int

    public let description: String

    /// Primary invite link for this group; may be null. For chat administrators with can_invite_users right only. Updated only after the basic group is opened
    public let inviteLink: ChatInviteLink?

    /// Group members
    public let members: [ChatMember]

    /// Chat photo; may be null
    public let photo: ChatPhoto?

    public init(
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