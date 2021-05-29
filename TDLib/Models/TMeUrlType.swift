//
//  TMeUrlType.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes the type of a URL linking to an internal Telegram entity
internal enum TMeUrlType: Codable {
    /// A URL linking to a user
    case tMeUrlTypeUser(TMeUrlTypeUser)

    /// A URL linking to a public supergroup or channel
    case tMeUrlTypeSupergroup(TMeUrlTypeSupergroup)

    /// A chat invite link
    case tMeUrlTypeChatInvite(TMeUrlTypeChatInvite)

    /// A URL linking to a sticker set
    case tMeUrlTypeStickerSet(TMeUrlTypeStickerSet)

    private enum Kind: String, Codable {
        case tMeUrlTypeUser
        case tMeUrlTypeSupergroup
        case tMeUrlTypeChatInvite
        case tMeUrlTypeStickerSet
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .tMeUrlTypeUser:
            let value = try TMeUrlTypeUser(from: decoder)
            self = .tMeUrlTypeUser(value)
        case .tMeUrlTypeSupergroup:
            let value = try TMeUrlTypeSupergroup(from: decoder)
            self = .tMeUrlTypeSupergroup(value)
        case .tMeUrlTypeChatInvite:
            let value = try TMeUrlTypeChatInvite(from: decoder)
            self = .tMeUrlTypeChatInvite(value)
        case .tMeUrlTypeStickerSet:
            let value = try TMeUrlTypeStickerSet(from: decoder)
            self = .tMeUrlTypeStickerSet(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .tMeUrlTypeUser(value):
            try container.encode(Kind.tMeUrlTypeUser, forKey: .type)
            try value.encode(to: encoder)
        case let .tMeUrlTypeSupergroup(value):
            try container.encode(Kind.tMeUrlTypeSupergroup, forKey: .type)
            try value.encode(to: encoder)
        case let .tMeUrlTypeChatInvite(value):
            try container.encode(Kind.tMeUrlTypeChatInvite, forKey: .type)
            try value.encode(to: encoder)
        case let .tMeUrlTypeStickerSet(value):
            try container.encode(Kind.tMeUrlTypeStickerSet, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A URL linking to a user
internal struct TMeUrlTypeUser: Codable {
    /// Identifier of the user
    internal let userId: Int

    internal init(userId: Int) {
        self.userId = userId
    }
}

/// A URL linking to a public supergroup or channel
internal struct TMeUrlTypeSupergroup: Codable {
    /// Identifier of the supergroup or channel
    internal let supergroupId: Int64

    internal init(supergroupId: Int64) {
        self.supergroupId = supergroupId
    }
}

/// A chat invite link
internal struct TMeUrlTypeChatInvite: Codable {
    /// Chat invite link info
    internal let info: ChatInviteLinkInfo

    internal init(info: ChatInviteLinkInfo) {
        self.info = info
    }
}

/// A URL linking to a sticker set
internal struct TMeUrlTypeStickerSet: Codable {
    /// Identifier of the sticker set
    internal let stickerSetId: TdInt64

    internal init(stickerSetId: TdInt64) {
        self.stickerSetId = stickerSetId
    }
}
