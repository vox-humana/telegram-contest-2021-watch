//
//  SetName.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the first and last name of the current user
internal struct SetName: Codable {
    /// The new value of the first name for the user; 1-64 characters
    internal let firstName: String

    /// The new value of the optional last name for the user; 0-64 characters
    internal let lastName: String

    internal init(
        firstName: String,
        lastName: String
    ) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
