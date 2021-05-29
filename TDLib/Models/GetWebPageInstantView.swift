//
//  GetWebPageInstantView.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns an instant view version of a web page if available. Returns a 404 error if the web page has no instant view page
internal struct GetWebPageInstantView: Codable {
    /// If true, the full instant view for the web page will be returned
    internal let forceFull: Bool

    /// The web page URL
    internal let url: String

    internal init(
        forceFull: Bool,
        url: String
    ) {
        self.forceFull = forceFull
        self.url = url
    }
}
