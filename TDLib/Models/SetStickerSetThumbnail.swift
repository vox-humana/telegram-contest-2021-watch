//
//  SetStickerSetThumbnail.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets a sticker set thumbnail; for bots only. Returns the sticker set
internal struct SetStickerSetThumbnail: Codable {
    /// Sticker set name
    internal let name: String

    /// Thumbnail to set in PNG or TGS format. Animated thumbnail must be set for animated sticker sets and only for them. Pass a zero InputFileId to delete the thumbnail
    internal let thumbnail: InputFile

    /// Sticker set owner
    internal let userId: Int

    internal init(
        name: String,
        thumbnail: InputFile,
        userId: Int
    ) {
        self.name = name
        self.thumbnail = thumbnail
        self.userId = userId
    }
}
