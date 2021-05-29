//
//  HttpUrl.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains an HTTP URL
internal struct HttpUrl: Codable {
    /// The URL
    internal let url: String

    internal init(url: String) {
        self.url = url
    }
}
