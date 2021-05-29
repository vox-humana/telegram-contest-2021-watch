//
//  StatisticalValue.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A value with information about its recent changes
internal struct StatisticalValue: Codable {
    /// The growth rate of the value, as a percentage
    internal let growthRatePercentage: Double

    /// The value for the previous day
    internal let previousValue: Double

    /// The current value
    internal let value: Double

    internal init(
        growthRatePercentage: Double,
        previousValue: Double,
        value: Double
    ) {
        self.growthRatePercentage = growthRatePercentage
        self.previousValue = previousValue
        self.value = value
    }
}
