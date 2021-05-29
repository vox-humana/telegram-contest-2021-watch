//
//  SetAccountTtl.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the period of inactivity after which the account of the current user will automatically be deleted
internal struct SetAccountTtl: Codable {
    /// New account TTL
    internal let ttl: AccountTtl

    internal init(ttl: AccountTtl) {
        self.ttl = ttl
    }
}
