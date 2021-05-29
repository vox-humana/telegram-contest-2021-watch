//
//  GetFileExtension.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. Can be called synchronously
internal struct GetFileExtension: Codable {
    /// The MIME type of the file
    internal let mimeType: String

    internal init(mimeType: String) {
        self.mimeType = mimeType
    }
}
