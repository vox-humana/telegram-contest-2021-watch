//
//  GetUserProfilePhotos.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the profile photos of a user. The result of this query may be outdated: some photos might have been deleted already
internal struct GetUserProfilePhotos: Codable {
    /// The maximum number of photos to be returned; up to 100
    internal let limit: Int

    /// The number of photos to skip; must be non-negative
    internal let offset: Int

    /// User identifier
    internal let userId: Int

    internal init(
        limit: Int,
        offset: Int,
        userId: Int
    ) {
        self.limit = limit
        self.offset = offset
        self.userId = userId
    }
}
