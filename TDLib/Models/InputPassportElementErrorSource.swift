//
//  InputPassportElementErrorSource.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains the description of an error in a Telegram Passport element; for bots only
internal enum InputPassportElementErrorSource: Codable {
    /// The element contains an error in an unspecified place. The error will be considered resolved when new data is added
    case inputPassportElementErrorSourceUnspecified(InputPassportElementErrorSourceUnspecified)

    /// A data field contains an error. The error is considered resolved when the field's value changes
    case inputPassportElementErrorSourceDataField(InputPassportElementErrorSourceDataField)

    /// The front side of the document contains an error. The error is considered resolved when the file with the front side of the document changes
    case inputPassportElementErrorSourceFrontSide(InputPassportElementErrorSourceFrontSide)

    /// The reverse side of the document contains an error. The error is considered resolved when the file with the reverse side of the document changes
    case inputPassportElementErrorSourceReverseSide(InputPassportElementErrorSourceReverseSide)

    /// The selfie contains an error. The error is considered resolved when the file with the selfie changes
    case inputPassportElementErrorSourceSelfie(InputPassportElementErrorSourceSelfie)

    /// One of the files containing the translation of the document contains an error. The error is considered resolved when the file with the translation changes
    case inputPassportElementErrorSourceTranslationFile(InputPassportElementErrorSourceTranslationFile)

    /// The translation of the document contains an error. The error is considered resolved when the list of files changes
    case inputPassportElementErrorSourceTranslationFiles(InputPassportElementErrorSourceTranslationFiles)

    /// The file contains an error. The error is considered resolved when the file changes
    case inputPassportElementErrorSourceFile(InputPassportElementErrorSourceFile)

    /// The list of attached files contains an error. The error is considered resolved when the file list changes
    case inputPassportElementErrorSourceFiles(InputPassportElementErrorSourceFiles)

    private enum Kind: String, Codable {
        case inputPassportElementErrorSourceUnspecified
        case inputPassportElementErrorSourceDataField
        case inputPassportElementErrorSourceFrontSide
        case inputPassportElementErrorSourceReverseSide
        case inputPassportElementErrorSourceSelfie
        case inputPassportElementErrorSourceTranslationFile
        case inputPassportElementErrorSourceTranslationFiles
        case inputPassportElementErrorSourceFile
        case inputPassportElementErrorSourceFiles
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .inputPassportElementErrorSourceUnspecified:
            let value = try InputPassportElementErrorSourceUnspecified(from: decoder)
            self = .inputPassportElementErrorSourceUnspecified(value)
        case .inputPassportElementErrorSourceDataField:
            let value = try InputPassportElementErrorSourceDataField(from: decoder)
            self = .inputPassportElementErrorSourceDataField(value)
        case .inputPassportElementErrorSourceFrontSide:
            let value = try InputPassportElementErrorSourceFrontSide(from: decoder)
            self = .inputPassportElementErrorSourceFrontSide(value)
        case .inputPassportElementErrorSourceReverseSide:
            let value = try InputPassportElementErrorSourceReverseSide(from: decoder)
            self = .inputPassportElementErrorSourceReverseSide(value)
        case .inputPassportElementErrorSourceSelfie:
            let value = try InputPassportElementErrorSourceSelfie(from: decoder)
            self = .inputPassportElementErrorSourceSelfie(value)
        case .inputPassportElementErrorSourceTranslationFile:
            let value = try InputPassportElementErrorSourceTranslationFile(from: decoder)
            self = .inputPassportElementErrorSourceTranslationFile(value)
        case .inputPassportElementErrorSourceTranslationFiles:
            let value = try InputPassportElementErrorSourceTranslationFiles(from: decoder)
            self = .inputPassportElementErrorSourceTranslationFiles(value)
        case .inputPassportElementErrorSourceFile:
            let value = try InputPassportElementErrorSourceFile(from: decoder)
            self = .inputPassportElementErrorSourceFile(value)
        case .inputPassportElementErrorSourceFiles:
            let value = try InputPassportElementErrorSourceFiles(from: decoder)
            self = .inputPassportElementErrorSourceFiles(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .inputPassportElementErrorSourceUnspecified(value):
            try container.encode(Kind.inputPassportElementErrorSourceUnspecified, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementErrorSourceDataField(value):
            try container.encode(Kind.inputPassportElementErrorSourceDataField, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementErrorSourceFrontSide(value):
            try container.encode(Kind.inputPassportElementErrorSourceFrontSide, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementErrorSourceReverseSide(value):
            try container.encode(Kind.inputPassportElementErrorSourceReverseSide, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementErrorSourceSelfie(value):
            try container.encode(Kind.inputPassportElementErrorSourceSelfie, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementErrorSourceTranslationFile(value):
            try container.encode(Kind.inputPassportElementErrorSourceTranslationFile, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementErrorSourceTranslationFiles(value):
            try container.encode(Kind.inputPassportElementErrorSourceTranslationFiles, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementErrorSourceFile(value):
            try container.encode(Kind.inputPassportElementErrorSourceFile, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementErrorSourceFiles(value):
            try container.encode(Kind.inputPassportElementErrorSourceFiles, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// The element contains an error in an unspecified place. The error will be considered resolved when new data is added
internal struct InputPassportElementErrorSourceUnspecified: Codable {
    /// Current hash of the entire element
    internal let elementHash: Data

    internal init(elementHash: Data) {
        self.elementHash = elementHash
    }
}

/// A data field contains an error. The error is considered resolved when the field's value changes
internal struct InputPassportElementErrorSourceDataField: Codable {
    /// Current data hash
    internal let dataHash: Data

    /// Field name
    internal let fieldName: String

    internal init(
        dataHash: Data,
        fieldName: String
    ) {
        self.dataHash = dataHash
        self.fieldName = fieldName
    }
}

/// The front side of the document contains an error. The error is considered resolved when the file with the front side of the document changes
internal struct InputPassportElementErrorSourceFrontSide: Codable {
    /// Current hash of the file containing the front side
    internal let fileHash: Data

    internal init(fileHash: Data) {
        self.fileHash = fileHash
    }
}

/// The reverse side of the document contains an error. The error is considered resolved when the file with the reverse side of the document changes
internal struct InputPassportElementErrorSourceReverseSide: Codable {
    /// Current hash of the file containing the reverse side
    internal let fileHash: Data

    internal init(fileHash: Data) {
        self.fileHash = fileHash
    }
}

/// The selfie contains an error. The error is considered resolved when the file with the selfie changes
internal struct InputPassportElementErrorSourceSelfie: Codable {
    /// Current hash of the file containing the selfie
    internal let fileHash: Data

    internal init(fileHash: Data) {
        self.fileHash = fileHash
    }
}

/// One of the files containing the translation of the document contains an error. The error is considered resolved when the file with the translation changes
internal struct InputPassportElementErrorSourceTranslationFile: Codable {
    /// Current hash of the file containing the translation
    internal let fileHash: Data

    internal init(fileHash: Data) {
        self.fileHash = fileHash
    }
}

/// The translation of the document contains an error. The error is considered resolved when the list of files changes
internal struct InputPassportElementErrorSourceTranslationFiles: Codable {
    /// Current hashes of all files with the translation
    internal let fileHashes: [Data]

    internal init(fileHashes: [Data]) {
        self.fileHashes = fileHashes
    }
}

/// The file contains an error. The error is considered resolved when the file changes
internal struct InputPassportElementErrorSourceFile: Codable {
    /// Current hash of the file which has the error
    internal let fileHash: Data

    internal init(fileHash: Data) {
        self.fileHash = fileHash
    }
}

/// The list of attached files contains an error. The error is considered resolved when the file list changes
internal struct InputPassportElementErrorSourceFiles: Codable {
    /// Current hashes of all attached files
    internal let fileHashes: [Data]

    internal init(fileHashes: [Data]) {
        self.fileHashes = fileHashes
    }
}
