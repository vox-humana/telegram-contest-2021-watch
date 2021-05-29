//
//  CheckAuthenticationPassword.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Checks the authentication password for correctness. Works only when the current authorization state is authorizationStateWaitPassword
internal struct CheckAuthenticationPassword: Codable {
    /// The password to check
    internal let password: String

    internal init(password: String) {
        self.password = password
    }
}
