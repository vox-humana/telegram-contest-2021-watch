//
//  SetSupergroupStickerSet.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes the sticker set of a supergroup; requires can_change_info administrator right
internal struct SetSupergroupStickerSet: Codable {
    /// New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
    internal let stickerSetId: TdInt64

    /// Identifier of the supergroup
    internal let supergroupId: Int

    internal init(
        stickerSetId: TdInt64,
        supergroupId: Int
    ) {
        self.stickerSetId = stickerSetId
        self.supergroupId = supergroupId
    }
}
