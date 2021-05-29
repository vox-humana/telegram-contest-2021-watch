//
//  NetworkStatistics.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A full list of available network statistic entries
internal struct NetworkStatistics: Codable {
    /// Network statistics entries
    internal let entries: [NetworkStatisticsEntry]

    /// Point in time (Unix timestamp) from which the statistics are collected
    internal let sinceDate: Int

    internal init(
        entries: [NetworkStatisticsEntry],
        sinceDate: Int
    ) {
        self.entries = entries
        self.sinceDate = sinceDate
    }
}
