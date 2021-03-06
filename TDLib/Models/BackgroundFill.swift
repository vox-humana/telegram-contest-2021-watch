//
//  BackgroundFill.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a fill of a background
internal enum BackgroundFill: Codable {
    /// Describes a solid fill of a background
    case backgroundFillSolid(BackgroundFillSolid)

    /// Describes a gradient fill of a background
    case backgroundFillGradient(BackgroundFillGradient)

    private enum Kind: String, Codable {
        case backgroundFillSolid
        case backgroundFillGradient
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .backgroundFillSolid:
            let value = try BackgroundFillSolid(from: decoder)
            self = .backgroundFillSolid(value)
        case .backgroundFillGradient:
            let value = try BackgroundFillGradient(from: decoder)
            self = .backgroundFillGradient(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .backgroundFillSolid(value):
            try container.encode(Kind.backgroundFillSolid, forKey: .type)
            try value.encode(to: encoder)
        case let .backgroundFillGradient(value):
            try container.encode(Kind.backgroundFillGradient, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// Describes a solid fill of a background
internal struct BackgroundFillSolid: Codable {
    /// A color of the background in the RGB24 format
    internal let color: Int

    internal init(color: Int) {
        self.color = color
    }
}

/// Describes a gradient fill of a background
internal struct BackgroundFillGradient: Codable {
    /// A bottom color of the background in the RGB24 format
    internal let bottomColor: Int

    /// Clockwise rotation angle of the gradient, in degrees; 0-359. Should be always divisible by 45
    internal let rotationAngle: Int

    /// A top color of the background in the RGB24 format
    internal let topColor: Int

    internal init(
        bottomColor: Int,
        rotationAngle: Int,
        topColor: Int
    ) {
        self.bottomColor = bottomColor
        self.rotationAngle = rotationAngle
        self.topColor = topColor
    }
}
