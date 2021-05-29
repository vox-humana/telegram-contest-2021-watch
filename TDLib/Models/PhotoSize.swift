//
//  PhotoSize.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes an image in JPEG format
internal struct PhotoSize: Codable {
    /// Image height
    internal let height: Int

    /// Information about the image file
    internal let photo: File

    /// Sizes of progressive JPEG file prefixes, which can be used to preliminarily show the image
    internal let progressiveSizes: [Int]

    /// Image type (see https://core.telegram.org/constructor/photoSize)
    internal let type: String

    /// Image width
    internal let width: Int

    internal init(
        height: Int,
        photo: File,
        progressiveSizes: [Int],
        type: String,
        width: Int
    ) {
        self.height = height
        self.photo = photo
        self.progressiveSizes = progressiveSizes
        self.type = type
        self.width = width
    }
}
