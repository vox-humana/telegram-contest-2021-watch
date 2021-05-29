//
//  GetProxyLink.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns an HTTPS link, which can be used to add a proxy. Available only for SOCKS5 and MTProto proxies. Can be called before authorization
internal struct GetProxyLink: Codable {
    /// Proxy identifier
    internal let proxyId: Int

    internal init(proxyId: Int) {
        self.proxyId = proxyId
    }
}
