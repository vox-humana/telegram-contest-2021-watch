//
//  PassportElementErrorSource.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the description of an error in a Telegram Passport element
internal enum PassportElementErrorSource: Codable {
    /// The element contains an error in an unspecified place. The error will be considered resolved when new data is added
    case passportElementErrorSourceUnspecified

    /// One of the data fields contains an error. The error will be considered resolved when the value of the field changes
    case passportElementErrorSourceDataField(PassportElementErrorSourceDataField)

    /// The front side of the document contains an error. The error will be considered resolved when the file with the front side changes
    case passportElementErrorSourceFrontSide

    /// The reverse side of the document contains an error. The error will be considered resolved when the file with the reverse side changes
    case passportElementErrorSourceReverseSide

    /// The selfie with the document contains an error. The error will be considered resolved when the file with the selfie changes
    case passportElementErrorSourceSelfie

    /// One of files with the translation of the document contains an error. The error will be considered resolved when the file changes
    case passportElementErrorSourceTranslationFile(PassportElementErrorSourceTranslationFile)

    /// The translation of the document contains an error. The error will be considered resolved when the list of translation files changes
    case passportElementErrorSourceTranslationFiles

    /// The file contains an error. The error will be considered resolved when the file changes
    case passportElementErrorSourceFile(PassportElementErrorSourceFile)

    /// The list of attached files contains an error. The error will be considered resolved when the list of files changes
    case passportElementErrorSourceFiles

    private enum Kind: String, Codable {
        case passportElementErrorSourceUnspecified
        case passportElementErrorSourceDataField
        case passportElementErrorSourceFrontSide
        case passportElementErrorSourceReverseSide
        case passportElementErrorSourceSelfie
        case passportElementErrorSourceTranslationFile
        case passportElementErrorSourceTranslationFiles
        case passportElementErrorSourceFile
        case passportElementErrorSourceFiles
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .passportElementErrorSourceUnspecified:
            self = .passportElementErrorSourceUnspecified
        case .passportElementErrorSourceDataField:
            let value = try PassportElementErrorSourceDataField(from: decoder)
            self = .passportElementErrorSourceDataField(value)
        case .passportElementErrorSourceFrontSide:
            self = .passportElementErrorSourceFrontSide
        case .passportElementErrorSourceReverseSide:
            self = .passportElementErrorSourceReverseSide
        case .passportElementErrorSourceSelfie:
            self = .passportElementErrorSourceSelfie
        case .passportElementErrorSourceTranslationFile:
            let value = try PassportElementErrorSourceTranslationFile(from: decoder)
            self = .passportElementErrorSourceTranslationFile(value)
        case .passportElementErrorSourceTranslationFiles:
            self = .passportElementErrorSourceTranslationFiles
        case .passportElementErrorSourceFile:
            let value = try PassportElementErrorSourceFile(from: decoder)
            self = .passportElementErrorSourceFile(value)
        case .passportElementErrorSourceFiles:
            self = .passportElementErrorSourceFiles
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .passportElementErrorSourceUnspecified:
            try container.encode(Kind.passportElementErrorSourceUnspecified, forKey: .type)
        case let .passportElementErrorSourceDataField(value):
            try container.encode(Kind.passportElementErrorSourceDataField, forKey: .type)
            try value.encode(to: encoder)
        case .passportElementErrorSourceFrontSide:
            try container.encode(Kind.passportElementErrorSourceFrontSide, forKey: .type)
        case .passportElementErrorSourceReverseSide:
            try container.encode(Kind.passportElementErrorSourceReverseSide, forKey: .type)
        case .passportElementErrorSourceSelfie:
            try container.encode(Kind.passportElementErrorSourceSelfie, forKey: .type)
        case let .passportElementErrorSourceTranslationFile(value):
            try container.encode(Kind.passportElementErrorSourceTranslationFile, forKey: .type)
            try value.encode(to: encoder)
        case .passportElementErrorSourceTranslationFiles:
            try container.encode(Kind.passportElementErrorSourceTranslationFiles, forKey: .type)
        case let .passportElementErrorSourceFile(value):
            try container.encode(Kind.passportElementErrorSourceFile, forKey: .type)
            try value.encode(to: encoder)
        case .passportElementErrorSourceFiles:
            try container.encode(Kind.passportElementErrorSourceFiles, forKey: .type)
        }
    }
}

/// One of the data fields contains an error. The error will be considered resolved when the value of the field changes
internal struct PassportElementErrorSourceDataField: Codable {
    /// Field name
    internal let fieldName: String

    internal init(fieldName: String) {
        self.fieldName = fieldName
    }
}

/// One of files with the translation of the document contains an error. The error will be considered resolved when the file changes
internal struct PassportElementErrorSourceTranslationFile: Codable {
    /// Index of a file with the error
    internal let fileIndex: Int

    internal init(fileIndex: Int) {
        self.fileIndex = fileIndex
    }
}

/// The file contains an error. The error will be considered resolved when the file changes
internal struct PassportElementErrorSourceFile: Codable {
    /// Index of a file with the error
    internal let fileIndex: Int

    internal init(fileIndex: Int) {
        self.fileIndex = fileIndex
    }
}
