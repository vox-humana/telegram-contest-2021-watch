//
//  PageBlockVerticalAlignment.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a Vertical alignment of a table cell content
internal enum PageBlockVerticalAlignment: Codable {
    /// The content should be top-aligned
    case pageBlockVerticalAlignmentTop

    /// The content should be middle-aligned
    case pageBlockVerticalAlignmentMiddle

    /// The content should be bottom-aligned
    case pageBlockVerticalAlignmentBottom

    private enum Kind: String, Codable {
        case pageBlockVerticalAlignmentTop
        case pageBlockVerticalAlignmentMiddle
        case pageBlockVerticalAlignmentBottom
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .pageBlockVerticalAlignmentTop:
            self = .pageBlockVerticalAlignmentTop
        case .pageBlockVerticalAlignmentMiddle:
            self = .pageBlockVerticalAlignmentMiddle
        case .pageBlockVerticalAlignmentBottom:
            self = .pageBlockVerticalAlignmentBottom
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .pageBlockVerticalAlignmentTop:
            try container.encode(Kind.pageBlockVerticalAlignmentTop, forKey: .type)
        case .pageBlockVerticalAlignmentMiddle:
            try container.encode(Kind.pageBlockVerticalAlignmentMiddle, forKey: .type)
        case .pageBlockVerticalAlignmentBottom:
            try container.encode(Kind.pageBlockVerticalAlignmentBottom, forKey: .type)
        }
    }
}
