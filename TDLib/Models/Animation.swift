//
//  Animation.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes an animation file. The animation must be encoded in GIF or MPEG4 format
internal struct Animation: Codable {
    /// File containing the animation
    internal let animation: File

    /// Duration of the animation, in seconds; as defined by the sender
    internal let duration: Int

    /// Original name of the file; as defined by the sender
    internal let fileName: String

    /// True, if stickers were added to the animation. The list of corresponding sticker set can be received using getAttachedStickerSets
    internal let hasStickers: Bool

    /// Height of the animation
    internal let height: Int

    /// MIME type of the file, usually "image/gif" or "video/mp4"
    internal let mimeType: String

    /// Animation minithumbnail; may be null
    internal let minithumbnail: Minithumbnail?

    /// Animation thumbnail in JPEG or MPEG4 format; may be null
    internal let thumbnail: Thumbnail?

    /// Width of the animation
    internal let width: Int

    internal init(
        animation: File,
        duration: Int,
        fileName: String,
        hasStickers: Bool,
        height: Int,
        mimeType: String,
        minithumbnail: Minithumbnail?,
        thumbnail: Thumbnail?,
        width: Int
    ) {
        self.animation = animation
        self.duration = duration
        self.fileName = fileName
        self.hasStickers = hasStickers
        self.height = height
        self.mimeType = mimeType
        self.minithumbnail = minithumbnail
        self.thumbnail = thumbnail
        self.width = width
    }
}
