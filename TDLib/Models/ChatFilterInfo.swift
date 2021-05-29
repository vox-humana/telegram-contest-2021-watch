//
//  ChatFilterInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains basic information about a chat filter
internal struct ChatFilterInfo: Codable {
    /// The icon name for short filter representation. One of "All", "Unread", "Unmuted", "Bots", "Channels", "Groups", "Private", "Custom", "Setup", "Cat", "Crown", "Favorite", "Flower", "Game", "Home", "Love", "Mask", "Party", "Sport", "Study", "Trade", "Travel", "Work"
    internal let iconName: String

    /// Unique chat filter identifier
    internal let id: Int

    /// The title of the filter; 1-12 characters without line feeds
    internal let title: String

    internal init(
        iconName: String,
        id: Int,
        title: String
    ) {
        self.iconName = iconName
        self.id = id
        self.title = title
    }
}
