//
//  CallServer.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a server for relaying call data
internal struct CallServer: Codable {
    /// Server identifier
    internal let id: TdInt64

    /// Server IPv4 address
    internal let ipAddress: String

    /// Server IPv6 address
    internal let ipv6Address: String

    /// Server port number
    internal let port: Int

    /// Server type
    internal let type: CallServerType

    internal init(
        id: TdInt64,
        ipAddress: String,
        ipv6Address: String,
        port: Int,
        type: CallServerType
    ) {
        self.id = id
        self.ipAddress = ipAddress
        self.ipv6Address = ipv6Address
        self.port = port
        self.type = type
    }
}
