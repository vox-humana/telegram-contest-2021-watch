//
//  GetNetworkStatistics.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns network data usage statistics. Can be called before authorization
internal struct GetNetworkStatistics: Codable {
    /// If true, returns only data for the current library launch
    internal let onlyCurrent: Bool

    internal init(onlyCurrent: Bool) {
        self.onlyCurrent = onlyCurrent
    }
}
