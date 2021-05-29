//
//  ProxyType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes the type of a proxy server
internal enum ProxyType: Codable {
    /// A SOCKS5 proxy server
    case proxyTypeSocks5(ProxyTypeSocks5)

    /// A HTTP transparent proxy server
    case proxyTypeHttp(ProxyTypeHttp)

    /// An MTProto proxy server
    case proxyTypeMtproto(ProxyTypeMtproto)

    private enum Kind: String, Codable {
        case proxyTypeSocks5
        case proxyTypeHttp
        case proxyTypeMtproto
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .proxyTypeSocks5:
            let value = try ProxyTypeSocks5(from: decoder)
            self = .proxyTypeSocks5(value)
        case .proxyTypeHttp:
            let value = try ProxyTypeHttp(from: decoder)
            self = .proxyTypeHttp(value)
        case .proxyTypeMtproto:
            let value = try ProxyTypeMtproto(from: decoder)
            self = .proxyTypeMtproto(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .proxyTypeSocks5(value):
            try container.encode(Kind.proxyTypeSocks5, forKey: .type)
            try value.encode(to: encoder)
        case let .proxyTypeHttp(value):
            try container.encode(Kind.proxyTypeHttp, forKey: .type)
            try value.encode(to: encoder)
        case let .proxyTypeMtproto(value):
            try container.encode(Kind.proxyTypeMtproto, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A SOCKS5 proxy server
internal struct ProxyTypeSocks5: Codable {
    /// Password for logging in; may be empty
    internal let password: String

    /// Username for logging in; may be empty
    internal let username: String

    internal init(
        password: String,
        username: String
    ) {
        self.password = password
        self.username = username
    }
}

/// A HTTP transparent proxy server
internal struct ProxyTypeHttp: Codable {
    /// Pass true if the proxy supports only HTTP requests and doesn't support transparent TCP connections via HTTP CONNECT method
    internal let httpOnly: Bool

    /// Password for logging in; may be empty
    internal let password: String

    /// Username for logging in; may be empty
    internal let username: String

    internal init(
        httpOnly: Bool,
        password: String,
        username: String
    ) {
        self.httpOnly = httpOnly
        self.password = password
        self.username = username
    }
}

/// An MTProto proxy server
internal struct ProxyTypeMtproto: Codable {
    /// The proxy's secret in hexadecimal encoding
    internal let secret: String

    internal init(secret: String) {
        self.secret = secret
    }
}
