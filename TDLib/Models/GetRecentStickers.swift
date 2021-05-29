//
//  GetRecentStickers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a list of recently used stickers
internal struct GetRecentStickers: Codable {
    /// Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
    internal let isAttached: Bool

    internal init(isAttached: Bool) {
        self.isAttached = isAttached
    }
}
