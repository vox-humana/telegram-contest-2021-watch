//
//  SecretChat.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a secret chat
internal struct SecretChat: Codable {
    /// Secret chat identifier
    internal let id: Int

    /// True, if the chat was created by the current user; otherwise false
    internal let isOutbound: Bool

    /// Hash of the currently used key for comparison with the hash of the chat partner's key. This is a string of 36 little-endian bytes, which must be split into groups of 2 bits, each denoting a pixel of one of 4 colors FFFFFF, D5E6F3, 2D5775, and 2F99C9.//-The pixels must be used to make a 12x12 square image filled from left to right, top to bottom. Alternatively, the first 32 bytes of the hash can be converted to the hexadecimal format and printed as 32 2-digit hex numbers
    internal let keyHash: Data

    /// Secret chat layer; determines features supported by the chat partner's application. Video notes are supported if the layer >= 66; nested text entities and underline and strikethrough entities are supported if the layer >= 101
    internal let layer: Int

    /// State of the secret chat
    internal let state: SecretChatState

    /// Identifier of the chat partner
    internal let userId: Int

    internal init(
        id: Int,
        isOutbound: Bool,
        keyHash: Data,
        layer: Int,
        state: SecretChatState,
        userId: Int
    ) {
        self.id = id
        self.isOutbound = isOutbound
        self.keyHash = keyHash
        self.layer = layer
        self.state = state
        self.userId = userId
    }
}
