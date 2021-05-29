//
//  Seconds.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a value representing a number of seconds
internal struct Seconds: Codable {
    /// Number of seconds
    internal let seconds: Double

    internal init(seconds: Double) {
        self.seconds = seconds
    }
}
