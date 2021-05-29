//
//  GetArchivedStickerSets.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a list of archived sticker sets
internal struct GetArchivedStickerSets: Codable {
    /// Pass true to return mask stickers sets; pass false to return ordinary sticker sets
    internal let isMasks: Bool

    /// The maximum number of sticker sets to return
    internal let limit: Int

    /// Identifier of the sticker set from which to return the result
    internal let offsetStickerSetId: TdInt64

    internal init(
        isMasks: Bool,
        limit: Int,
        offsetStickerSetId: TdInt64
    ) {
        self.isMasks = isMasks
        self.limit = limit
        self.offsetStickerSetId = offsetStickerSetId
    }
}
