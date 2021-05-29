//
//  TestProxy.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called before authorization
internal struct TestProxy: Codable {
    /// Identifier of a datacenter, with which to test connection
    internal let dcId: Int

    /// Proxy server port
    internal let port: Int

    /// Proxy server IP address
    internal let server: String

    /// The maximum overall timeout for the request
    internal let timeout: Double

    /// Proxy type
    internal let type: ProxyType

    internal init(
        dcId: Int,
        port: Int,
        server: String,
        timeout: Double,
        type: ProxyType
    ) {
        self.dcId = dcId
        self.port = port
        self.server = server
        self.timeout = timeout
        self.type = type
    }
}
