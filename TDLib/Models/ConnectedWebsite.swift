//
//  ConnectedWebsite.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about one website the current user is logged in with Telegram
internal struct ConnectedWebsite: Codable {
    /// User identifier of a bot linked with the website
    internal let botUserId: Int

    /// The version of a browser used to log in
    internal let browser: String

    /// The domain name of the website
    internal let domainName: String

    /// Website identifier
    internal let id: TdInt64

    /// IP address from which the user was logged in, in human-readable format
    internal let ip: String

    /// Point in time (Unix timestamp) when obtained authorization was last used
    internal let lastActiveDate: Int

    /// Human-readable description of a country and a region, from which the user was logged in, based on the IP address
    internal let location: String

    /// Point in time (Unix timestamp) when the user was logged in
    internal let logInDate: Int

    /// Operating system the browser is running on
    internal let platform: String

    internal init(
        botUserId: Int,
        browser: String,
        domainName: String,
        id: TdInt64,
        ip: String,
        lastActiveDate: Int,
        location: String,
        logInDate: Int,
        platform: String
    ) {
        self.botUserId = botUserId
        self.browser = browser
        self.domainName = domainName
        self.id = id
        self.ip = ip
        self.lastActiveDate = lastActiveDate
        self.location = location
        self.logInDate = logInDate
        self.platform = platform
    }
}
