//
//  Poll.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a poll
internal struct Poll: Codable {
    /// Point in time (Unix timestamp) when the poll will be automatically closed
    internal let closeDate: Int

    /// Unique poll identifier
    internal let id: TdInt64

    /// True, if the poll is anonymous
    internal let isAnonymous: Bool

    /// True, if the poll is closed
    internal let isClosed: Bool

    /// Amount of time the poll will be active after creation, in seconds
    internal let openPeriod: Int

    /// List of poll answer options
    internal let options: [PollOption]

    /// Poll question; 1-300 characters
    internal let question: String

    /// User identifiers of recent voters, if the poll is non-anonymous
    internal let recentVoterUserIds: [Int]

    /// Total number of voters, participating in the poll
    internal let totalVoterCount: Int

    /// Type of the poll
    internal let type: PollType

    internal init(
        closeDate: Int,
        id: TdInt64,
        isAnonymous: Bool,
        isClosed: Bool,
        openPeriod: Int,
        options: [PollOption],
        question: String,
        recentVoterUserIds: [Int],
        totalVoterCount: Int,
        type: PollType
    ) {
        self.closeDate = closeDate
        self.id = id
        self.isAnonymous = isAnonymous
        self.isClosed = isClosed
        self.openPeriod = openPeriod
        self.options = options
        self.question = question
        self.recentVoterUserIds = recentVoterUserIds
        self.totalVoterCount = totalVoterCount
        self.type = type
    }
}
