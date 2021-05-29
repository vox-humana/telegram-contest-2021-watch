//
//  ChatMembers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of chat members
internal struct ChatMembers: Codable {
    /// A list of chat members
    internal let members: [ChatMember]

    /// Approximate total count of chat members found
    internal let totalCount: Int

    internal init(
        members: [ChatMember],
        totalCount: Int
    ) {
        self.members = members
        self.totalCount = totalCount
    }
}
