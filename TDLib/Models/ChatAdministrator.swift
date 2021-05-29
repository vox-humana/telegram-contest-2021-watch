//
//  ChatAdministrator.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a chat administrator
internal struct ChatAdministrator: Codable {
    /// Custom title of the administrator
    internal let customTitle: String

    /// True, if the user is the owner of the chat
    internal let isOwner: Bool

    /// User identifier of the administrator
    internal let userId: Int

    internal init(
        customTitle: String,
        isOwner: Bool,
        userId: Int
    ) {
        self.customTitle = customTitle
        self.isOwner = isOwner
        self.userId = userId
    }
}
