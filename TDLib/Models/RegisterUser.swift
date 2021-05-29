//
//  RegisterUser.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Finishes user registration. Works only when the current authorization state is authorizationStateWaitRegistration
internal struct RegisterUser: Codable {
    /// The first name of the user; 1-64 characters
    internal let firstName: String

    /// The last name of the user; 0-64 characters
    internal let lastName: String

    internal init(
        firstName: String,
        lastName: String
    ) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
