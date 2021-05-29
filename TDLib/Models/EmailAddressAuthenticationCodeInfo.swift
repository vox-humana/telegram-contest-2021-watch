//
//  EmailAddressAuthenticationCodeInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Information about the email address authentication code that was sent
internal struct EmailAddressAuthenticationCodeInfo: Codable {
    /// Pattern of the email address to which an authentication code was sent
    internal let emailAddressPattern: String

    /// Length of the code; 0 if unknown
    internal let length: Int

    internal init(
        emailAddressPattern: String,
        length: Int
    ) {
        self.emailAddressPattern = emailAddressPattern
        self.length = length
    }
}
