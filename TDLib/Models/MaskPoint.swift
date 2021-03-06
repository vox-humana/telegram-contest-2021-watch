//
//  MaskPoint.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Part of the face, relative to which a mask should be placed
internal enum MaskPoint: Codable {
    /// A mask should be placed relatively to the forehead
    case maskPointForehead

    /// A mask should be placed relatively to the eyes
    case maskPointEyes

    /// A mask should be placed relatively to the mouth
    case maskPointMouth

    /// A mask should be placed relatively to the chin
    case maskPointChin

    private enum Kind: String, Codable {
        case maskPointForehead
        case maskPointEyes
        case maskPointMouth
        case maskPointChin
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .maskPointForehead:
            self = .maskPointForehead
        case .maskPointEyes:
            self = .maskPointEyes
        case .maskPointMouth:
            self = .maskPointMouth
        case .maskPointChin:
            self = .maskPointChin
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .maskPointForehead:
            try container.encode(Kind.maskPointForehead, forKey: .type)
        case .maskPointEyes:
            try container.encode(Kind.maskPointEyes, forKey: .type)
        case .maskPointMouth:
            try container.encode(Kind.maskPointMouth, forKey: .type)
        case .maskPointChin:
            try container.encode(Kind.maskPointChin, forKey: .type)
        }
    }
}
