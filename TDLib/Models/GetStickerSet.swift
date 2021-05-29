//
//  GetStickerSet.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns information about a sticker set by its identifier
internal struct GetStickerSet: Codable {
    /// Identifier of the sticker set
    internal let setId: TdInt64

    internal init(setId: TdInt64) {
        self.setId = setId
    }
}
