//
//  CallProtocol.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Specifies the supported call protocols
internal struct CallProtocol: Codable {
    /// List of supported tgcalls versions
    internal let libraryVersions: [String]

    /// The maximum supported API layer; use 65
    internal let maxLayer: Int

    /// The minimum supported API layer; use 65
    internal let minLayer: Int

    /// True, if UDP peer-to-peer connections are supported
    internal let udpP2p: Bool

    /// True, if connection through UDP reflectors is supported
    internal let udpReflector: Bool

    internal init(
        libraryVersions: [String],
        maxLayer: Int,
        minLayer: Int,
        udpP2p: Bool,
        udpReflector: Bool
    ) {
        self.libraryVersions = libraryVersions
        self.maxLayer = maxLayer
        self.minLayer = minLayer
        self.udpP2p = udpP2p
        self.udpReflector = udpReflector
    }
}
