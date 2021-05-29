//
//  Sessions.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of sessions
internal struct Sessions: Codable {
    /// List of sessions
    internal let sessions: [Session]

    internal init(sessions: [Session]) {
        self.sessions = sessions
    }
}
