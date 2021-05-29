//
//  WebPageInstantView.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes an instant view page for a web page
internal struct WebPageInstantView: Codable {
    /// True, if the instant view contains the full page. A network request might be needed to get the full web page instant view
    internal let isFull: Bool

    /// True, if the instant view must be shown from right to left
    internal let isRtl: Bool

    /// Content of the web page
    internal let pageBlocks: [PageBlock]

    /// Version of the instant view, currently can be 1 or 2
    internal let version: Int

    /// Number of the instant view views; 0 if unknown
    internal let viewCount: Int

    internal init(
        isFull: Bool,
        isRtl: Bool,
        pageBlocks: [PageBlock],
        version: Int,
        viewCount: Int
    ) {
        self.isFull = isFull
        self.isRtl = isRtl
        self.pageBlocks = pageBlocks
        self.version = version
        self.viewCount = viewCount
    }
}
