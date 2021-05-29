//
//  GetAllPassportElements.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns all available Telegram Passport elements
internal struct GetAllPassportElements: Codable {
    /// Password of the current user
    internal let password: String

    internal init(password: String) {
        self.password = password
    }
}
