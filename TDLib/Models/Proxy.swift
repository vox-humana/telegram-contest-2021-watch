//
//  Proxy.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a proxy server
internal struct Proxy: Codable {
    /// Unique identifier of the proxy
    internal let id: Int

    /// True, if the proxy is enabled now
    internal let isEnabled: Bool

    /// Point in time (Unix timestamp) when the proxy was last used; 0 if never
    internal let lastUsedDate: Int

    /// Proxy server port
    internal let port: Int

    /// Proxy server IP address
    internal let server: String

    /// Type of the proxy
    internal let type: ProxyType

    internal init(
        id: Int,
        isEnabled: Bool,
        lastUsedDate: Int,
        port: Int,
        server: String,
        type: ProxyType
    ) {
        self.id = id
        self.isEnabled = isEnabled
        self.lastUsedDate = lastUsedDate
        self.port = port
        self.server = server
        self.type = type
    }
}
