//
//  Date.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a date according to the Gregorian calendar
internal struct DateContent: Codable {
    /// Day of the month; 1-31
    internal let day: Int

    /// Month; 1-12
    internal let month: Int

    /// Year; 1-9999
    internal let year: Int

    internal init(
        day: Int,
        month: Int,
        year: Int
    ) {
        self.day = day
        self.month = month
        self.year = year
    }
}
