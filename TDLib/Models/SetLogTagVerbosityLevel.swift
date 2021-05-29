//
//  SetLogTagVerbosityLevel.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets the verbosity level for a specified TDLib internal log tag. Can be called synchronously
internal struct SetLogTagVerbosityLevel: Codable {
    /// New verbosity level; 1-1024
    internal let newVerbosityLevel: Int

    /// Logging tag to change verbosity level
    internal let tag: String

    internal init(
        newVerbosityLevel: Int,
        tag: String
    ) {
        self.newVerbosityLevel = newVerbosityLevel
        self.tag = tag
    }
}
