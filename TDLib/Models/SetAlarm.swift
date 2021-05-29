//
//  SetAlarm.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Succeeds after a specified amount of time has passed. Can be called before initialization
internal struct SetAlarm: Codable {
    /// Number of seconds before the function returns
    internal let seconds: Double

    internal init(seconds: Double) {
        self.seconds = seconds
    }
}
