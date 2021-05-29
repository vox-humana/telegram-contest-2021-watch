//
//  SendCallRating.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends a call rating
internal struct SendCallRating: Codable {
    /// Call identifier
    internal let callId: Int

    /// An optional user comment if the rating is less than 5
    internal let comment: String

    /// List of the exact types of problems with the call, specified by the user
    internal let problems: [CallProblem]

    /// Call rating; 1-5
    internal let rating: Int

    internal init(
        callId: Int,
        comment: String,
        problems: [CallProblem],
        rating: Int
    ) {
        self.callId = callId
        self.comment = comment
        self.problems = problems
        self.rating = rating
    }
}
