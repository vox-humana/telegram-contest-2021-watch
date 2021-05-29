//
//  InputPersonalDocument.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A personal document to be saved to Telegram Passport
internal struct InputPersonalDocument: Codable {
    /// List of files containing the pages of the document
    internal let files: [InputFile]

    /// List of files containing a certified English translation of the document
    internal let translation: [InputFile]

    internal init(
        files: [InputFile],
        translation: [InputFile]
    ) {
        self.files = files
        self.translation = translation
    }
}
