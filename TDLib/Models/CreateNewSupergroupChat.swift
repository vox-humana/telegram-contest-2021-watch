//
//  CreateNewSupergroupChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat
internal struct CreateNewSupergroupChat: Codable {
    internal let description: String

    /// True, if the supergroup is created for importing messages using importMessage
    internal let forImport: Bool

    /// True, if a channel chat needs to be created
    internal let isChannel: Bool

    /// Chat location if a location-based supergroup is being created
    internal let location: ChatLocation

    /// Title of the new chat; 1-128 characters
    internal let title: String

    internal init(
        description: String,
        forImport: Bool,
        isChannel: Bool,
        location: ChatLocation,
        title: String
    ) {
        self.description = description
        self.forImport = forImport
        self.isChannel = isChannel
        self.location = location
        self.title = title
    }
}
