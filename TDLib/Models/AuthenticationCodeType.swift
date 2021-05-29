//
//  AuthenticationCodeType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Provides information about the method by which an authentication code is delivered to the user
internal enum AuthenticationCodeType: Codable {
    /// An authentication code is delivered via a private Telegram message, which can be viewed from another active session
    case authenticationCodeTypeTelegramMessage(AuthenticationCodeTypeTelegramMessage)

    /// An authentication code is delivered via an SMS message to the specified phone number
    case authenticationCodeTypeSms(AuthenticationCodeTypeSms)

    /// An authentication code is delivered via a phone call to the specified phone number
    case authenticationCodeTypeCall(AuthenticationCodeTypeCall)

    /// An authentication code is delivered by an immediately cancelled call to the specified phone number. The number from which the call was made is the code
    case authenticationCodeTypeFlashCall(AuthenticationCodeTypeFlashCall)

    private enum Kind: String, Codable {
        case authenticationCodeTypeTelegramMessage
        case authenticationCodeTypeSms
        case authenticationCodeTypeCall
        case authenticationCodeTypeFlashCall
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .authenticationCodeTypeTelegramMessage:
            let value = try AuthenticationCodeTypeTelegramMessage(from: decoder)
            self = .authenticationCodeTypeTelegramMessage(value)
        case .authenticationCodeTypeSms:
            let value = try AuthenticationCodeTypeSms(from: decoder)
            self = .authenticationCodeTypeSms(value)
        case .authenticationCodeTypeCall:
            let value = try AuthenticationCodeTypeCall(from: decoder)
            self = .authenticationCodeTypeCall(value)
        case .authenticationCodeTypeFlashCall:
            let value = try AuthenticationCodeTypeFlashCall(from: decoder)
            self = .authenticationCodeTypeFlashCall(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .authenticationCodeTypeTelegramMessage(value):
            try container.encode(Kind.authenticationCodeTypeTelegramMessage, forKey: .type)
            try value.encode(to: encoder)
        case let .authenticationCodeTypeSms(value):
            try container.encode(Kind.authenticationCodeTypeSms, forKey: .type)
            try value.encode(to: encoder)
        case let .authenticationCodeTypeCall(value):
            try container.encode(Kind.authenticationCodeTypeCall, forKey: .type)
            try value.encode(to: encoder)
        case let .authenticationCodeTypeFlashCall(value):
            try container.encode(Kind.authenticationCodeTypeFlashCall, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// An authentication code is delivered via a private Telegram message, which can be viewed from another active session
internal struct AuthenticationCodeTypeTelegramMessage: Codable {
    /// Length of the code
    internal let length: Int

    internal init(length: Int) {
        self.length = length
    }
}

/// An authentication code is delivered via an SMS message to the specified phone number
internal struct AuthenticationCodeTypeSms: Codable {
    /// Length of the code
    internal let length: Int

    internal init(length: Int) {
        self.length = length
    }
}

/// An authentication code is delivered via a phone call to the specified phone number
internal struct AuthenticationCodeTypeCall: Codable {
    /// Length of the code
    internal let length: Int

    internal init(length: Int) {
        self.length = length
    }
}

/// An authentication code is delivered by an immediately cancelled call to the specified phone number. The number from which the call was made is the code
internal struct AuthenticationCodeTypeFlashCall: Codable {
    /// Pattern of the phone number from which the call will be made
    internal let pattern: String

    internal init(pattern: String) {
        self.pattern = pattern
    }
}
