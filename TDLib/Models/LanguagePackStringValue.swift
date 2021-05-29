//
//  LanguagePackStringValue.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents the value of a string in a language pack
internal enum LanguagePackStringValue: Codable {
    /// An ordinary language pack string
    case languagePackStringValueOrdinary(LanguagePackStringValueOrdinary)

    /// A language pack string which has different forms based on the number of some object it mentions. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more info
    case languagePackStringValuePluralized(LanguagePackStringValuePluralized)

    /// A deleted language pack string, the value should be taken from the built-in english language pack
    case languagePackStringValueDeleted

    private enum Kind: String, Codable {
        case languagePackStringValueOrdinary
        case languagePackStringValuePluralized
        case languagePackStringValueDeleted
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .languagePackStringValueOrdinary:
            let value = try LanguagePackStringValueOrdinary(from: decoder)
            self = .languagePackStringValueOrdinary(value)
        case .languagePackStringValuePluralized:
            let value = try LanguagePackStringValuePluralized(from: decoder)
            self = .languagePackStringValuePluralized(value)
        case .languagePackStringValueDeleted:
            self = .languagePackStringValueDeleted
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .languagePackStringValueOrdinary(value):
            try container.encode(Kind.languagePackStringValueOrdinary, forKey: .type)
            try value.encode(to: encoder)
        case let .languagePackStringValuePluralized(value):
            try container.encode(Kind.languagePackStringValuePluralized, forKey: .type)
            try value.encode(to: encoder)
        case .languagePackStringValueDeleted:
            try container.encode(Kind.languagePackStringValueDeleted, forKey: .type)
        }
    }
}

/// An ordinary language pack string
internal struct LanguagePackStringValueOrdinary: Codable {
    /// String value
    internal let value: String

    internal init(value: String) {
        self.value = value
    }
}

/// A language pack string which has different forms based on the number of some object it mentions. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more info
internal struct LanguagePackStringValuePluralized: Codable {
    /// Value for few objects
    internal let fewValue: String

    /// Value for many objects
    internal let manyValue: String

    /// Value for one object
    internal let oneValue: String

    /// Default value
    internal let otherValue: String

    /// Value for two objects
    internal let twoValue: String

    /// Value for zero objects
    internal let zeroValue: String

    internal init(
        fewValue: String,
        manyValue: String,
        oneValue: String,
        otherValue: String,
        twoValue: String,
        zeroValue: String
    ) {
        self.fewValue = fewValue
        self.manyValue = manyValue
        self.oneValue = oneValue
        self.otherValue = otherValue
        self.twoValue = twoValue
        self.zeroValue = zeroValue
    }
}
