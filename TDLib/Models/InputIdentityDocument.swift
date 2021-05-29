//
//  InputIdentityDocument.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// An identity document to be saved to Telegram Passport
internal struct InputIdentityDocument: Codable {
    /// Document expiry date, if available
    internal let expiryDate: Date

    /// Front side of the document
    internal let frontSide: InputFile

    /// Document number; 1-24 characters
    internal let number: String

    /// Reverse side of the document; only for driver license and identity card
    internal let reverseSide: InputFile

    /// Selfie with the document, if available
    internal let selfie: InputFile

    /// List of files containing a certified English translation of the document
    internal let translation: [InputFile]

    internal init(
        expiryDate: Date,
        frontSide: InputFile,
        number: String,
        reverseSide: InputFile,
        selfie: InputFile,
        translation: [InputFile]
    ) {
        self.expiryDate = expiryDate
        self.frontSide = frontSide
        self.number = number
        self.reverseSide = reverseSide
        self.selfie = selfie
        self.translation = translation
    }
}
