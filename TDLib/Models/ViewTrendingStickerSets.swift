//
//  ViewTrendingStickerSets.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Informs the server that some trending sticker sets have been viewed by the user
internal struct ViewTrendingStickerSets: Codable {
    /// Identifiers of viewed trending sticker sets
    internal let stickerSetIds: [TdInt64]

    internal init(stickerSetIds: [TdInt64]) {
        self.stickerSetIds = stickerSetIds
    }
}
