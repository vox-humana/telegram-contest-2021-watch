//
//  AuthenticationCodeInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Information about the authentication code that was sent
internal struct AuthenticationCodeInfo: Codable {
    /// Describes the way the next code will be sent to the user; may be null
    internal let nextType: AuthenticationCodeType?

    /// A phone number that is being authenticated
    internal let phoneNumber: String

    /// Timeout before the code should be re-sent, in seconds
    internal let timeout: Int

    /// Describes the way the code was sent to the user
    internal let type: AuthenticationCodeType

    internal init(
        nextType: AuthenticationCodeType?,
        phoneNumber: String,
        timeout: Int,
        type: AuthenticationCodeType
    ) {
        self.nextType = nextType
        self.phoneNumber = phoneNumber
        self.timeout = timeout
        self.type = type
    }
}
