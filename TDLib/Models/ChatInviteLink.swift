//
//  ChatInviteLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a chat invite link
internal struct ChatInviteLink: Codable {
    /// User identifier of an administrator created the link
    internal let creatorUserId: Int

    /// Point in time (Unix timestamp) when the link was created
    internal let date: Int

    /// Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown
    internal let editDate: Int

    /// Point in time (Unix timestamp) when the link will expire; 0 if never
    internal let expireDate: Int

    /// Chat invite link
    internal let inviteLink: String

    /// True, if the link is primary. Primary invite link can't have expire date or usage limit. There is exactly one primary invite link for each administrator with can_invite_users right at a given time
    internal let isPrimary: Bool

    /// True, if the link was revoked
    internal let isRevoked: Bool

    /// Number of chat members, which joined the chat using the link
    internal let memberCount: Int

    /// The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited
    internal let memberLimit: Int

    internal init(
        creatorUserId: Int,
        date: Int,
        editDate: Int,
        expireDate: Int,
        inviteLink: String,
        isPrimary: Bool,
        isRevoked: Bool,
        memberCount: Int,
        memberLimit: Int
    ) {
        self.creatorUserId = creatorUserId
        self.date = date
        self.editDate = editDate
        self.expireDate = expireDate
        self.inviteLink = inviteLink
        self.isPrimary = isPrimary
        self.isRevoked = isRevoked
        self.memberCount = memberCount
        self.memberLimit = memberLimit
    }
}
