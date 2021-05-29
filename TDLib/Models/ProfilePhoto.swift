//
//  ProfilePhoto.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a user profile photo
internal struct ProfilePhoto: Codable {
    /// A big (640x640) user profile photo. The file can be downloaded only before the photo is changed
    internal let big: File

    /// True, if the photo has animated variant
    internal let hasAnimation: Bool

    /// Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of user profile photos
    internal let id: TdInt64

    /// User profile photo minithumbnail; may be null
    internal let minithumbnail: Minithumbnail?

    /// A small (160x160) user profile photo. The file can be downloaded only before the photo is changed
    internal let small: File

    internal init(
        big: File,
        hasAnimation: Bool,
        id: TdInt64,
        minithumbnail: Minithumbnail?,
        small: File
    ) {
        self.big = big
        self.hasAnimation = hasAnimation
        self.id = id
        self.minithumbnail = minithumbnail
        self.small = small
    }
}
