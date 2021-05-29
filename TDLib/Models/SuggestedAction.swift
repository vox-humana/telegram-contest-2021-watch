//
//  SuggestedAction.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes an action suggested to the current user
internal enum SuggestedAction: Codable {
    /// Suggests the user to enable "archive_and_mute_new_chats_from_unknown_users" option
    case suggestedActionEnableArchiveAndMuteNewChats

    /// Suggests the user to check authorization phone number and change the phone number if it is inaccessible
    case suggestedActionCheckPhoneNumber

    /// Suggests the user to see a hint about meaning of one and two ticks on sent message
    case suggestedActionSeeTicksHint

    /// Suggests the user to convert specified supergroup to a broadcast group
    case suggestedActionConvertToBroadcastGroup(SuggestedActionConvertToBroadcastGroup)

    private enum Kind: String, Codable {
        case suggestedActionEnableArchiveAndMuteNewChats
        case suggestedActionCheckPhoneNumber
        case suggestedActionSeeTicksHint
        case suggestedActionConvertToBroadcastGroup
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .suggestedActionEnableArchiveAndMuteNewChats:
            self = .suggestedActionEnableArchiveAndMuteNewChats
        case .suggestedActionCheckPhoneNumber:
            self = .suggestedActionCheckPhoneNumber
        case .suggestedActionSeeTicksHint:
            self = .suggestedActionSeeTicksHint
        case .suggestedActionConvertToBroadcastGroup:
            let value = try SuggestedActionConvertToBroadcastGroup(from: decoder)
            self = .suggestedActionConvertToBroadcastGroup(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .suggestedActionEnableArchiveAndMuteNewChats:
            try container.encode(Kind.suggestedActionEnableArchiveAndMuteNewChats, forKey: .type)
        case .suggestedActionCheckPhoneNumber:
            try container.encode(Kind.suggestedActionCheckPhoneNumber, forKey: .type)
        case .suggestedActionSeeTicksHint:
            try container.encode(Kind.suggestedActionSeeTicksHint, forKey: .type)
        case let .suggestedActionConvertToBroadcastGroup(value):
            try container.encode(Kind.suggestedActionConvertToBroadcastGroup, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// Suggests the user to convert specified supergroup to a broadcast group
internal struct SuggestedActionConvertToBroadcastGroup: Codable {
    /// Supergroup identifier
    internal let supergroupId: Int

    internal init(supergroupId: Int) {
        self.supergroupId = supergroupId
    }
}
