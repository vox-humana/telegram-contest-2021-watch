//
//  ChatInviteLinkMembers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of chat members joined a chat by an invite link
internal struct ChatInviteLinkMembers: Codable {
    /// List of chat members, joined a chat by an invite link
    internal let members: [ChatInviteLinkMember]

    /// Approximate total count of chat members found
    internal let totalCount: Int

    internal init(
        members: [ChatInviteLinkMember],
        totalCount: Int
    ) {
        self.members = members
        self.totalCount = totalCount
    }
}
