//
//  IdentityDocument.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// An identity document
internal struct IdentityDocument: Codable {
    /// Document expiry date; may be null
    internal let expiryDate: Date?

    /// Front side of the document
    internal let frontSide: DatedFile

    /// Document number; 1-24 characters
    internal let number: String

    /// Reverse side of the document; only for driver license and identity card
    internal let reverseSide: DatedFile

    /// Selfie with the document; may be null
    internal let selfie: DatedFile?

    /// List of files containing a certified English translation of the document
    internal let translation: [DatedFile]

    internal init(
        expiryDate: Date?,
        frontSide: DatedFile,
        number: String,
        reverseSide: DatedFile,
        selfie: DatedFile?,
        translation: [DatedFile]
    ) {
        self.expiryDate = expiryDate
        self.frontSide = frontSide
        self.number = number
        self.reverseSide = reverseSide
        self.selfie = selfie
        self.translation = translation
    }
}
