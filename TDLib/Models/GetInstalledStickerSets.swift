//
//  GetInstalledStickerSets.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns a list of installed sticker sets
internal struct GetInstalledStickerSets: Codable {
    /// Pass true to return mask sticker sets; pass false to return ordinary sticker sets
    internal let isMasks: Bool

    internal init(isMasks: Bool) {
        self.isMasks = isMasks
    }
}
