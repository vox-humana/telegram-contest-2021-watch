//
//  DeleteProfilePhoto.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Deletes a profile photo
internal struct DeleteProfilePhoto: Codable {
    /// Identifier of the profile photo to delete
    internal let profilePhotoId: TdInt64

    internal init(profilePhotoId: TdInt64) {
        self.profilePhotoId = profilePhotoId
    }
}
