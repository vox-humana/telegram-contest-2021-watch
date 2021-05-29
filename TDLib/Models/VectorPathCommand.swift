//
//  VectorPathCommand.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a vector path command
internal enum VectorPathCommand: Codable {
    /// A straight line to a given point
    case vectorPathCommandLine(VectorPathCommandLine)

    /// A cubic Bézier curve to a given point
    case vectorPathCommandCubicBezierCurve(VectorPathCommandCubicBezierCurve)

    private enum Kind: String, Codable {
        case vectorPathCommandLine
        case vectorPathCommandCubicBezierCurve
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .vectorPathCommandLine:
            let value = try VectorPathCommandLine(from: decoder)
            self = .vectorPathCommandLine(value)
        case .vectorPathCommandCubicBezierCurve:
            let value = try VectorPathCommandCubicBezierCurve(from: decoder)
            self = .vectorPathCommandCubicBezierCurve(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .vectorPathCommandLine(value):
            try container.encode(Kind.vectorPathCommandLine, forKey: .type)
            try value.encode(to: encoder)
        case let .vectorPathCommandCubicBezierCurve(value):
            try container.encode(Kind.vectorPathCommandCubicBezierCurve, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A straight line to a given point
internal struct VectorPathCommandLine: Codable {
    /// The end point of the straight line
    internal let endPoint: Point

    internal init(endPoint: Point) {
        self.endPoint = endPoint
    }
}

/// A cubic Bézier curve to a given point
internal struct VectorPathCommandCubicBezierCurve: Codable {
    /// The end control point of the curve
    internal let endControlPoint: Point

    /// The end point of the curve
    internal let endPoint: Point

    /// The start control point of the curve
    internal let startControlPoint: Point

    internal init(
        endControlPoint: Point,
        endPoint: Point,
        startControlPoint: Point
    ) {
        self.endControlPoint = endControlPoint
        self.endPoint = endPoint
        self.startControlPoint = startControlPoint
    }
}
