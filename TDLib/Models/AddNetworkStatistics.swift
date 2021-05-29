//
//  AddNetworkStatistics.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds the specified data to data usage statistics. Can be called before authorization
internal struct AddNetworkStatistics: Codable {
    /// The network statistics entry with the data to be added to statistics
    internal let entry: NetworkStatisticsEntry

    internal init(entry: NetworkStatisticsEntry) {
        self.entry = entry
    }
}
