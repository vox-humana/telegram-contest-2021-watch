//
//  DateRange.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a date range
internal struct DateRange: Codable {
    /// Point in time (Unix timestamp) at which the date range ends
    internal let endDate: Int

    /// Point in time (Unix timestamp) at which the date range begins
    internal let startDate: Int

    internal init(
        endDate: Int,
        startDate: Int
    ) {
        self.endDate = endDate
        self.startDate = startDate
    }
}
