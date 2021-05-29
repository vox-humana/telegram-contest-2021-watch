//
//  PersonalDocument.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A personal document, containing some information about a user
internal struct PersonalDocument: Codable {
    /// List of files containing the pages of the document
    internal let files: [DatedFile]

    /// List of files containing a certified English translation of the document
    internal let translation: [DatedFile]

    internal init(
        files: [DatedFile],
        translation: [DatedFile]
    ) {
        self.files = files
        self.translation = translation
    }
}
