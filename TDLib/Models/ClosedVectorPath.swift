//
//  ClosedVectorPath.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a closed vector path. The path begins at the end point of the last command
internal struct ClosedVectorPath: Codable {
    /// List of vector path commands
    internal let commands: [VectorPathCommand]

    internal init(commands: [VectorPathCommand]) {
        self.commands = commands
    }
}
