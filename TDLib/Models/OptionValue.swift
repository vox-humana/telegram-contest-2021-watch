//
//  OptionValue.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents the value of an option
internal enum OptionValue: Codable {
    /// Represents a boolean option
    case optionValueBoolean(OptionValueBoolean)

    /// Represents an unknown option or an option which has a default value
    case optionValueEmpty

    /// Represents an integer option
    case optionValueInteger(OptionValueInteger)

    /// Represents a string option
    case optionValueString(OptionValueString)

    private enum Kind: String, Codable {
        case optionValueBoolean
        case optionValueEmpty
        case optionValueInteger
        case optionValueString
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .optionValueBoolean:
            let value = try OptionValueBoolean(from: decoder)
            self = .optionValueBoolean(value)
        case .optionValueEmpty:
            self = .optionValueEmpty
        case .optionValueInteger:
            let value = try OptionValueInteger(from: decoder)
            self = .optionValueInteger(value)
        case .optionValueString:
            let value = try OptionValueString(from: decoder)
            self = .optionValueString(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .optionValueBoolean(value):
            try container.encode(Kind.optionValueBoolean, forKey: .type)
            try value.encode(to: encoder)
        case .optionValueEmpty:
            try container.encode(Kind.optionValueEmpty, forKey: .type)
        case let .optionValueInteger(value):
            try container.encode(Kind.optionValueInteger, forKey: .type)
            try value.encode(to: encoder)
        case let .optionValueString(value):
            try container.encode(Kind.optionValueString, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// Represents a boolean option
internal struct OptionValueBoolean: Codable {
    /// The value of the option
    internal let value: Bool

    internal init(value: Bool) {
        self.value = value
    }
}

/// Represents an integer option
internal struct OptionValueInteger: Codable {
    /// The value of the option
    internal let value: TdInt64

    internal init(value: TdInt64) {
        self.value = value
    }
}

/// Represents a string option
internal struct OptionValueString: Codable {
    /// The value of the option
    internal let value: String

    internal init(value: String) {
        self.value = value
    }
}
