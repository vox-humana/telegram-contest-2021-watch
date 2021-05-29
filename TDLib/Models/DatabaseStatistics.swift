//
//  DatabaseStatistics.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains database statistics
internal struct DatabaseStatistics: Codable {
    /// Database statistics in an unspecified human-readable format
    internal let statistics: String

    internal init(statistics: String) {
        self.statistics = statistics
    }
}
