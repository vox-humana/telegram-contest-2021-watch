//
//  EditProxy.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Edits an existing proxy server for network requests. Can be called before authorization
internal struct EditProxy: Codable {
    /// True, if the proxy should be enabled
    internal let enable: Bool

    /// Proxy server port
    internal let port: Int

    /// Proxy identifier
    internal let proxyId: Int

    /// Proxy server IP address
    internal let server: String

    /// Proxy type
    internal let type: ProxyType

    internal init(
        enable: Bool,
        port: Int,
        proxyId: Int,
        server: String,
        type: ProxyType
    ) {
        self.enable = enable
        self.port = port
        self.proxyId = proxyId
        self.server = server
        self.type = type
    }
}
