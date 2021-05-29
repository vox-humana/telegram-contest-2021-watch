//
//  Contact.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a user contact
internal struct Contact: Codable {
    /// First name of the user; 1-255 characters in length
    internal let firstName: String

    /// Last name of the user
    internal let lastName: String

    /// Phone number of the user
    internal let phoneNumber: String

    /// Identifier of the user, if known; otherwise 0
    internal let userId: Int

    /// Additional data about the user in a form of vCard; 0-2048 bytes in length
    internal let vcard: String

    internal init(
        firstName: String,
        lastName: String,
        phoneNumber: String,
        userId: Int,
        vcard: String
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.userId = userId
        self.vcard = vcard
    }
}
