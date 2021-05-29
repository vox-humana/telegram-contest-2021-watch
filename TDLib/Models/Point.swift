//
//  Point.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A point on a Cartesian plane
internal struct Point: Codable {
    /// The point's first coordinate
    internal let x: Double

    /// The point's second coordinate
    internal let y: Double

    internal init(
        x: Double,
        y: Double
    ) {
        self.x = x
        self.y = y
    }
}
