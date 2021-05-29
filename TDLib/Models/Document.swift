//
//  Document.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a document of any type
internal struct Document: Codable {
    /// File containing the document
    internal let document: File

    /// Original name of the file; as defined by the sender
    internal let fileName: String

    /// MIME type of the file; as defined by the sender
    internal let mimeType: String

    /// Document minithumbnail; may be null
    internal let minithumbnail: Minithumbnail?

    /// Document thumbnail in JPEG or PNG format (PNG will be used only for background patterns); as defined by the sender; may be null
    internal let thumbnail: Thumbnail?

    internal init(
        document: File,
        fileName: String,
        mimeType: String,
        minithumbnail: Minithumbnail?,
        thumbnail: Thumbnail?
    ) {
        self.document = document
        self.fileName = fileName
        self.mimeType = mimeType
        self.minithumbnail = minithumbnail
        self.thumbnail = thumbnail
    }
}
