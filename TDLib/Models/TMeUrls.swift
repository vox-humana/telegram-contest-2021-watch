//
//  TMeUrls.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of t.me URLs
internal struct TMeUrls: Codable {
    /// List of URLs
    internal let urls: [TMeUrl]

    internal init(urls: [TMeUrl]) {
        self.urls = urls
    }
}
