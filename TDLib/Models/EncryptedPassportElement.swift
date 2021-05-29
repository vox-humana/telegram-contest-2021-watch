//
//  EncryptedPassportElement.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about an encrypted Telegram Passport element; for bots only
internal struct EncryptedPassportElement: Codable {
    /// Encrypted JSON-encoded data about the user
    internal let data: Data

    /// List of attached files
    internal let files: [DatedFile]

    /// The front side of an identity document
    internal let frontSide: DatedFile

    /// Hash of the entire element
    internal let hash: String

    /// The reverse side of an identity document; may be null
    internal let reverseSide: DatedFile?

    /// Selfie with the document; may be null
    internal let selfie: DatedFile?

    /// List of files containing a certified English translation of the document
    internal let translation: [DatedFile]

    /// Type of Telegram Passport element
    internal let type: PassportElementType

    /// Unencrypted data, phone number or email address
    internal let value: String

    internal init(
        data: Data,
        files: [DatedFile],
        frontSide: DatedFile,
        hash: String,
        reverseSide: DatedFile?,
        selfie: DatedFile?,
        translation: [DatedFile],
        type: PassportElementType,
        value: String
    ) {
        self.data = data
        self.files = files
        self.frontSide = frontSide
        self.hash = hash
        self.reverseSide = reverseSide
        self.selfie = selfie
        self.translation = translation
        self.type = type
        self.value = value
    }
}
