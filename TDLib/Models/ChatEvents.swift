//
//  ChatEvents.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of chat events
internal struct ChatEvents: Codable {
    /// List of events
    internal let events: [ChatEvent]

    internal init(events: [ChatEvent]) {
        self.events = events
    }
}
