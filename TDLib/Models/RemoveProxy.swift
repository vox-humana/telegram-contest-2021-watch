//
//  RemoveProxy.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Removes a proxy server. Can be called before authorization
internal struct RemoveProxy: Codable {
    /// Proxy identifier
    internal let proxyId: Int

    internal init(proxyId: Int) {
        self.proxyId = proxyId
    }
}
