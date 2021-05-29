//
//  GetRecentlyVisitedTMeUrls.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns t.me URLs recently visited by a newly registered user
internal struct GetRecentlyVisitedTMeUrls: Codable {
    /// Google Play referrer to identify the user
    internal let referrer: String

    internal init(referrer: String) {
        self.referrer = referrer
    }
}
