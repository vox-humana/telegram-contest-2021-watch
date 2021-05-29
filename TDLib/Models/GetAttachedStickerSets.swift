//
//  GetAttachedStickerSets.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a list of sticker sets attached to a file. Currently only photos and videos can have attached sticker sets
internal struct GetAttachedStickerSets: Codable {
    /// File identifier
    internal let fileId: Int

    internal init(fileId: Int) {
        self.fileId = fileId
    }
}
