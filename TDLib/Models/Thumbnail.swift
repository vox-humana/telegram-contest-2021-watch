//
//  Thumbnail.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a thumbnail
internal struct Thumbnail: Codable {
    /// The thumbnail
    internal let file: File

    /// Thumbnail format
    internal let format: ThumbnailFormat

    /// Thumbnail height
    internal let height: Int

    /// Thumbnail width
    internal let width: Int

    internal init(
        file: File,
        format: ThumbnailFormat,
        height: Int,
        width: Int
    ) {
        self.file = file
        self.format = format
        self.height = height
        self.width = width
    }
}
