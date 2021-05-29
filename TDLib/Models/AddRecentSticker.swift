//
//  AddRecentSticker.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list
internal struct AddRecentSticker: Codable {
    /// Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers
    internal let isAttached: Bool

    /// Sticker file to add
    internal let sticker: InputFile

    internal init(
        isAttached: Bool,
        sticker: InputFile
    ) {
        self.isAttached = isAttached
        self.sticker = sticker
    }
}
