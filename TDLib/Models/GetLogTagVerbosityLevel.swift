//
//  GetLogTagVerbosityLevel.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns current verbosity level for a specified TDLib internal log tag. Can be called synchronously
internal struct GetLogTagVerbosityLevel: Codable {
    /// Logging tag to change verbosity level
    internal let tag: String

    internal init(tag: String) {
        self.tag = tag
    }
}
