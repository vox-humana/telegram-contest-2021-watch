//
//  LogVerbosityLevel.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a TDLib internal log verbosity level
internal struct LogVerbosityLevel: Codable {
    /// Log verbosity level
    internal let verbosityLevel: Int

    internal init(verbosityLevel: Int) {
        self.verbosityLevel = verbosityLevel
    }
}
