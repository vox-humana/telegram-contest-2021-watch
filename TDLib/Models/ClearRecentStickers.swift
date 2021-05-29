//
//  ClearRecentStickers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Clears the list of recently used stickers
internal struct ClearRecentStickers: Codable {
    /// Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
    internal let isAttached: Bool

    internal init(isAttached: Bool) {
        self.isAttached = isAttached
    }
}
