//
//  EnableProxy.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Enables a proxy. Only one proxy can be enabled at a time. Can be called before authorization
internal struct EnableProxy: Codable {
    /// Proxy identifier
    internal let proxyId: Int

    internal init(proxyId: Int) {
        self.proxyId = proxyId
    }
}
