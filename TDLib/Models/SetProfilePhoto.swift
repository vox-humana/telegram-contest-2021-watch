//
//  SetProfilePhoto.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Changes a profile photo for the current user
internal struct SetProfilePhoto: Codable {
    /// Profile photo to set
    internal let photo: InputChatPhoto

    internal init(photo: InputChatPhoto) {
        self.photo = photo
    }
}
