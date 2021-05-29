//
//  Minithumbnail.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Thumbnail image of a very poor quality and low resolution
internal struct Minithumbnail: Codable {
    /// The thumbnail in JPEG format
    internal let data: Data

    /// Thumbnail height, usually doesn't exceed 40
    internal let height: Int

    /// Thumbnail width, usually doesn't exceed 40
    internal let width: Int

    internal init(
        data: Data,
        height: Int,
        width: Int
    ) {
        self.data = data
        self.height = height
        self.width = width
    }
}
