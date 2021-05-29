//
//  Proxies.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a list of proxy servers
internal struct Proxies: Codable {
    /// List of proxy servers
    internal let proxies: [Proxy]

    internal init(proxies: [Proxy]) {
        self.proxies = proxies
    }
}
