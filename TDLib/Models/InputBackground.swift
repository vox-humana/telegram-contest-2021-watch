//
//  InputBackground.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about background to set
internal enum InputBackground: Codable {
    /// A background from a local file
    case inputBackgroundLocal(InputBackgroundLocal)

    /// A background from the server
    case inputBackgroundRemote(InputBackgroundRemote)

    private enum Kind: String, Codable {
        case inputBackgroundLocal
        case inputBackgroundRemote
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .inputBackgroundLocal:
            let value = try InputBackgroundLocal(from: decoder)
            self = .inputBackgroundLocal(value)
        case .inputBackgroundRemote:
            let value = try InputBackgroundRemote(from: decoder)
            self = .inputBackgroundRemote(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .inputBackgroundLocal(value):
            try container.encode(Kind.inputBackgroundLocal, forKey: .type)
            try value.encode(to: encoder)
        case let .inputBackgroundRemote(value):
            try container.encode(Kind.inputBackgroundRemote, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A background from a local file
internal struct InputBackgroundLocal: Codable {
    /// Background file to use. Only inputFileLocal and inputFileGenerated are supported. The file must be in JPEG format for wallpapers and in PNG format for patterns
    internal let background: InputFile

    internal init(background: InputFile) {
        self.background = background
    }
}

/// A background from the server
internal struct InputBackgroundRemote: Codable {
    /// The background identifier
    internal let backgroundId: TdInt64

    internal init(backgroundId: TdInt64) {
        self.backgroundId = backgroundId
    }
}
