//
//  User.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a user
internal struct User: Codable {
    /// First name of the user
    internal let firstName: String

    /// If false, the user is inaccessible, and the only information known about the user is inside this class. It can't be passed to any method except GetUser
    internal let haveAccess: Bool

    /// User identifier
    internal let id: Int

    /// The user is a contact of the current user
    internal let isContact: Bool

    /// True, if many users reported this user as a fake account
    internal let isFake: Bool

    /// The user is a contact of the current user and the current user is a contact of the user
    internal let isMutualContact: Bool

    /// True, if many users reported this user as a scam
    internal let isScam: Bool

    /// True, if the user is Telegram support account
    internal let isSupport: Bool

    /// True, if the user is verified
    internal let isVerified: Bool

    /// IETF language tag of the user's language; only available to bots
    internal let languageCode: String

    /// Last name of the user
    internal let lastName: String

    /// Phone number of the user
    internal let phoneNumber: String

    /// Profile photo of the user; may be null
    internal let profilePhoto: ProfilePhoto?

    /// If non-empty, it contains a human-readable description of the reason why access to this user must be restricted
    internal let restrictionReason: String

    /// Current online status of the user
    internal let status: UserStatus

    /// Type of the user
    internal let type: UserType

    /// Username of the user
    internal let username: String

    internal init(
        firstName: String,
        haveAccess: Bool,
        id: Int,
        isContact: Bool,
        isFake: Bool,
        isMutualContact: Bool,
        isScam: Bool,
        isSupport: Bool,
        isVerified: Bool,
        languageCode: String,
        lastName: String,
        phoneNumber: String,
        profilePhoto: ProfilePhoto?,
        restrictionReason: String,
        status: UserStatus,
        type: UserType,
        username: String
    ) {
        self.firstName = firstName
        self.haveAccess = haveAccess
        self.id = id
        self.isContact = isContact
        self.isFake = isFake
        self.isMutualContact = isMutualContact
        self.isScam = isScam
        self.isSupport = isSupport
        self.isVerified = isVerified
        self.languageCode = languageCode
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.profilePhoto = profilePhoto
        self.restrictionReason = restrictionReason
        self.status = status
        self.type = type
        self.username = username
    }
}
