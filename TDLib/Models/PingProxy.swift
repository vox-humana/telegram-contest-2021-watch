//
//  PingProxy.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization
internal struct PingProxy: Codable {
    /// Proxy identifier. Use 0 to ping a Telegram server without a proxy
    internal let proxyId: Int

    internal init(proxyId: Int) {
        self.proxyId = proxyId
    }
}
