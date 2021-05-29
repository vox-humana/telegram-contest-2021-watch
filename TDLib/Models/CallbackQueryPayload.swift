//
//  CallbackQueryPayload.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a payload of a callback query
internal enum CallbackQueryPayload: Codable {
    /// The payload for a general callback button
    case callbackQueryPayloadData(CallbackQueryPayloadData)

    /// The payload for a callback button requiring password
    case callbackQueryPayloadDataWithPassword(CallbackQueryPayloadDataWithPassword)

    /// The payload for a game callback button
    case callbackQueryPayloadGame(CallbackQueryPayloadGame)

    private enum Kind: String, Codable {
        case callbackQueryPayloadData
        case callbackQueryPayloadDataWithPassword
        case callbackQueryPayloadGame
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .callbackQueryPayloadData:
            let value = try CallbackQueryPayloadData(from: decoder)
            self = .callbackQueryPayloadData(value)
        case .callbackQueryPayloadDataWithPassword:
            let value = try CallbackQueryPayloadDataWithPassword(from: decoder)
            self = .callbackQueryPayloadDataWithPassword(value)
        case .callbackQueryPayloadGame:
            let value = try CallbackQueryPayloadGame(from: decoder)
            self = .callbackQueryPayloadGame(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .callbackQueryPayloadData(value):
            try container.encode(Kind.callbackQueryPayloadData, forKey: .type)
            try value.encode(to: encoder)
        case let .callbackQueryPayloadDataWithPassword(value):
            try container.encode(Kind.callbackQueryPayloadDataWithPassword, forKey: .type)
            try value.encode(to: encoder)
        case let .callbackQueryPayloadGame(value):
            try container.encode(Kind.callbackQueryPayloadGame, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// The payload for a general callback button
internal struct CallbackQueryPayloadData: Codable {
    /// Data that was attached to the callback button
    internal let data: Data

    internal init(data: Data) {
        self.data = data
    }
}

/// The payload for a callback button requiring password
internal struct CallbackQueryPayloadDataWithPassword: Codable {
    /// Data that was attached to the callback button
    internal let data: Data

    /// The password for the current user
    internal let password: String

    internal init(
        data: Data,
        password: String
    ) {
        self.data = data
        self.password = password
    }
}

/// The payload for a game callback button
internal struct CallbackQueryPayloadGame: Codable {
    /// A short name of the game that was attached to the callback button
    internal let gameShortName: String

    internal init(gameShortName: String) {
        self.gameShortName = gameShortName
    }
}
