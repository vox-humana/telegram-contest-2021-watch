//
//  ChatInviteLinkInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a chat invite link
internal struct ChatInviteLinkInfo: Codable {
    /// If non-zero, the amount of time for which read access to the chat will remain available, in seconds
    internal let accessibleFor: Int

    /// Chat identifier of the invite link; 0 if the user has no access to the chat before joining
    internal let chatId: Int64

    /// True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
    internal let isPublic: Bool

    /// Number of members in the chat
    internal let memberCount: Int

    /// User identifiers of some chat members that may be known to the current user
    internal let memberUserIds: [Int]

    /// Chat photo; may be null
    internal let photo: ChatPhotoInfo?

    /// Title of the chat
    internal let title: String

    /// Contains information about the type of the chat
    internal let type: ChatType

    internal init(
        accessibleFor: Int,
        chatId: Int64,
        isPublic: Bool,
        memberCount: Int,
        memberUserIds: [Int],
        photo: ChatPhotoInfo?,
        title: String,
        type: ChatType
    ) {
        self.accessibleFor = accessibleFor
        self.chatId = chatId
        self.isPublic = isPublic
        self.memberCount = memberCount
        self.memberUserIds = memberUserIds
        self.photo = photo
        self.title = title
        self.type = type
    }
}
