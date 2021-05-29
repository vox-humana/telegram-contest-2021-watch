//
//  TerminateSession.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Terminates a session of the current user
internal struct TerminateSession: Codable {
    /// Session identifier
    internal let sessionId: TdInt64

    internal init(sessionId: TdInt64) {
        self.sessionId = sessionId
    }
}
