//
//  UploadStickerFile.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Uploads a PNG image with a sticker; for bots only; returns the uploaded file
internal struct UploadStickerFile: Codable {
    /// PNG image with the sticker; must be up to 512 KB in size and fit in 512x512 square
    internal let pngSticker: InputFile

    /// Sticker file owner
    internal let userId: Int

    internal init(
        pngSticker: InputFile,
        userId: Int
    ) {
        self.pngSticker = pngSticker
        self.userId = userId
    }
}
