//
//  MessageLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains an HTTPS link to a message in a supergroup or channel
internal struct MessageLink: Codable {
    /// True, if the link will work for non-members of the chat
    internal let isPublic: Bool

    /// Message link
    internal let link: String

    internal init(
        isPublic: Bool,
        link: String
    ) {
        self.isPublic = isPublic
        self.link = link
    }
}
