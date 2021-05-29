//
//  Session.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about one session in a Telegram application used by the current user. Sessions should be shown to the user in the returned order
internal struct Session: Codable {
    /// Telegram API identifier, as provided by the application
    internal let apiId: Int

    /// Name of the application, as provided by the application
    internal let applicationName: String

    /// The version of the application, as provided by the application
    internal let applicationVersion: String

    /// A two-letter country code for the country from which the session was created, based on the IP address
    internal let country: String

    /// Model of the device the application has been run or is running on, as provided by the application
    internal let deviceModel: String

    /// Session identifier
    internal let id: TdInt64

    /// IP address from which the session was created, in human-readable format
    internal let ip: String

    /// True, if this session is the current session
    internal let isCurrent: Bool

    /// True, if the application is an official application or uses the api_id of an official application
    internal let isOfficialApplication: Bool

    /// True, if a password is needed to complete authorization of the session
    internal let isPasswordPending: Bool

    /// Point in time (Unix timestamp) when the session was last used
    internal let lastActiveDate: Int

    /// Point in time (Unix timestamp) when the user has logged in
    internal let logInDate: Int

    /// Operating system the application has been run or is running on, as provided by the application
    internal let platform: String

    /// Region code from which the session was created, based on the IP address
    internal let region: String

    /// Version of the operating system the application has been run or is running on, as provided by the application
    internal let systemVersion: String

    internal init(
        apiId: Int,
        applicationName: String,
        applicationVersion: String,
        country: String,
        deviceModel: String,
        id: TdInt64,
        ip: String,
        isCurrent: Bool,
        isOfficialApplication: Bool,
        isPasswordPending: Bool,
        lastActiveDate: Int,
        logInDate: Int,
        platform: String,
        region: String,
        systemVersion: String
    ) {
        self.apiId = apiId
        self.applicationName = applicationName
        self.applicationVersion = applicationVersion
        self.country = country
        self.deviceModel = deviceModel
        self.id = id
        self.ip = ip
        self.isCurrent = isCurrent
        self.isOfficialApplication = isOfficialApplication
        self.isPasswordPending = isPasswordPending
        self.lastActiveDate = lastActiveDate
        self.logInDate = logInDate
        self.platform = platform
        self.region = region
        self.systemVersion = systemVersion
    }
}
