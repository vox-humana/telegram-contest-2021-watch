//
//  ChangeStickerSet.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Installs/uninstalls or activates/archives a sticker set
internal struct ChangeStickerSet: Codable {
    /// The new value of is_archived. A sticker set can't be installed and archived simultaneously
    internal let isArchived: Bool

    /// The new value of is_installed
    internal let isInstalled: Bool

    /// Identifier of the sticker set
    internal let setId: TdInt64

    internal init(
        isArchived: Bool,
        isInstalled: Bool,
        setId: TdInt64
    ) {
        self.isArchived = isArchived
        self.isInstalled = isInstalled
        self.setId = setId
    }
}
