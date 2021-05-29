//
//  AddProxy.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Adds a proxy server for network requests. Can be called before authorization
internal struct AddProxy: Codable {
    /// True, if the proxy should be enabled
    internal let enable: Bool

    /// Proxy server port
    internal let port: Int

    /// Proxy server IP address
    internal let server: String

    /// Proxy type
    internal let type: ProxyType

    internal init(
        enable: Bool,
        port: Int,
        server: String,
        type: ProxyType
    ) {
        self.enable = enable
        self.port = port
        self.server = server
        self.type = type
    }
}
