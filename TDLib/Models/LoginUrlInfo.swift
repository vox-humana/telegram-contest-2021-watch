//
//  LoginUrlInfo.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about an inline button of type inlineKeyboardButtonTypeLoginUrl
internal enum LoginUrlInfo: Codable {
    /// An HTTP url needs to be open
    case loginUrlInfoOpen(LoginUrlInfoOpen)

    /// An authorization confirmation dialog needs to be shown to the user
    case loginUrlInfoRequestConfirmation(LoginUrlInfoRequestConfirmation)

    private enum Kind: String, Codable {
        case loginUrlInfoOpen
        case loginUrlInfoRequestConfirmation
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .loginUrlInfoOpen:
            let value = try LoginUrlInfoOpen(from: decoder)
            self = .loginUrlInfoOpen(value)
        case .loginUrlInfoRequestConfirmation:
            let value = try LoginUrlInfoRequestConfirmation(from: decoder)
            self = .loginUrlInfoRequestConfirmation(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .loginUrlInfoOpen(value):
            try container.encode(Kind.loginUrlInfoOpen, forKey: .type)
            try value.encode(to: encoder)
        case let .loginUrlInfoRequestConfirmation(value):
            try container.encode(Kind.loginUrlInfoRequestConfirmation, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// An HTTP url needs to be open
internal struct LoginUrlInfoOpen: Codable {
    /// True, if there is no need to show an ordinary open URL confirm
    internal let skipConfirm: Bool

    /// The URL to open
    internal let url: String

    internal init(
        skipConfirm: Bool,
        url: String
    ) {
        self.skipConfirm = skipConfirm
        self.url = url
    }
}

/// An authorization confirmation dialog needs to be shown to the user
internal struct LoginUrlInfoRequestConfirmation: Codable {
    /// User identifier of a bot linked with the website
    internal let botUserId: Int

    /// A domain of the URL
    internal let domain: String

    /// True, if the user needs to be requested to give the permission to the bot to send them messages
    internal let requestWriteAccess: Bool

    /// An HTTP URL to be opened
    internal let url: String

    internal init(
        botUserId: Int,
        domain: String,
        requestWriteAccess: Bool,
        url: String
    ) {
        self.botUserId = botUserId
        self.domain = domain
        self.requestWriteAccess = requestWriteAccess
        self.url = url
    }
}
