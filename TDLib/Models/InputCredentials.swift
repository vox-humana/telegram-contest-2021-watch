//
//  InputCredentials.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about the payment method chosen by the user
internal enum InputCredentials: Codable {
    /// Applies if a user chooses some previously saved payment credentials. To use their previously saved credentials, the user must have a valid temporary password
    case inputCredentialsSaved(InputCredentialsSaved)

    /// Applies if a user enters new credentials on a payment provider website
    case inputCredentialsNew(InputCredentialsNew)

    /// Applies if a user enters new credentials using Apple Pay
    case inputCredentialsApplePay(InputCredentialsApplePay)

    /// Applies if a user enters new credentials using Google Pay
    case inputCredentialsGooglePay(InputCredentialsGooglePay)

    private enum Kind: String, Codable {
        case inputCredentialsSaved
        case inputCredentialsNew
        case inputCredentialsApplePay
        case inputCredentialsGooglePay
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .inputCredentialsSaved:
            let value = try InputCredentialsSaved(from: decoder)
            self = .inputCredentialsSaved(value)
        case .inputCredentialsNew:
            let value = try InputCredentialsNew(from: decoder)
            self = .inputCredentialsNew(value)
        case .inputCredentialsApplePay:
            let value = try InputCredentialsApplePay(from: decoder)
            self = .inputCredentialsApplePay(value)
        case .inputCredentialsGooglePay:
            let value = try InputCredentialsGooglePay(from: decoder)
            self = .inputCredentialsGooglePay(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .inputCredentialsSaved(value):
            try container.encode(Kind.inputCredentialsSaved, forKey: .type)
            try value.encode(to: encoder)
        case let .inputCredentialsNew(value):
            try container.encode(Kind.inputCredentialsNew, forKey: .type)
            try value.encode(to: encoder)
        case let .inputCredentialsApplePay(value):
            try container.encode(Kind.inputCredentialsApplePay, forKey: .type)
            try value.encode(to: encoder)
        case let .inputCredentialsGooglePay(value):
            try container.encode(Kind.inputCredentialsGooglePay, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// Applies if a user chooses some previously saved payment credentials. To use their previously saved credentials, the user must have a valid temporary password
internal struct InputCredentialsSaved: Codable {
    /// Identifier of the saved credentials
    internal let savedCredentialsId: String

    internal init(savedCredentialsId: String) {
        self.savedCredentialsId = savedCredentialsId
    }
}

/// Applies if a user enters new credentials on a payment provider website
internal struct InputCredentialsNew: Codable {
    /// True, if the credential identifier can be saved on the server side
    internal let allowSave: Bool

    /// Contains JSON-encoded data with a credential identifier from the payment provider
    internal let data: String

    internal init(
        allowSave: Bool,
        data: String
    ) {
        self.allowSave = allowSave
        self.data = data
    }
}

/// Applies if a user enters new credentials using Apple Pay
internal struct InputCredentialsApplePay: Codable {
    /// JSON-encoded data with the credential identifier
    internal let data: String

    internal init(data: String) {
        self.data = data
    }
}

/// Applies if a user enters new credentials using Google Pay
internal struct InputCredentialsGooglePay: Codable {
    /// JSON-encoded data with the credential identifier
    internal let data: String

    internal init(data: String) {
        self.data = data
    }
}
