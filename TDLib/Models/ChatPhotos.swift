//
//  ChatPhotos.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains a list of chat or user profile photos
internal struct ChatPhotos: Codable {
    /// List of photos
    internal let photos: [ChatPhoto]

    /// Total number of photos
    internal let totalCount: Int

    internal init(
        photos: [ChatPhoto],
        totalCount: Int
    ) {
        self.photos = photos
        self.totalCount = totalCount
    }
}
