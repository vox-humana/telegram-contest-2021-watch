//
//  JsonValue.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a JSON value
internal enum JsonValue: Codable {
    /// Represents a null JSON value
    case jsonValueNull

    /// Represents a boolean JSON value
    case jsonValueBoolean(JsonValueBoolean)

    /// Represents a numeric JSON value
    case jsonValueNumber(JsonValueNumber)

    /// Represents a string JSON value
    case jsonValueString(JsonValueString)

    /// Represents a JSON array
    case jsonValueArray(JsonValueArray)

    /// Represents a JSON object
    case jsonValueObject(JsonValueObject)

    private enum Kind: String, Codable {
        case jsonValueNull
        case jsonValueBoolean
        case jsonValueNumber
        case jsonValueString
        case jsonValueArray
        case jsonValueObject
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .jsonValueNull:
            self = .jsonValueNull
        case .jsonValueBoolean:
            let value = try JsonValueBoolean(from: decoder)
            self = .jsonValueBoolean(value)
        case .jsonValueNumber:
            let value = try JsonValueNumber(from: decoder)
            self = .jsonValueNumber(value)
        case .jsonValueString:
            let value = try JsonValueString(from: decoder)
            self = .jsonValueString(value)
        case .jsonValueArray:
            let value = try JsonValueArray(from: decoder)
            self = .jsonValueArray(value)
        case .jsonValueObject:
            let value = try JsonValueObject(from: decoder)
            self = .jsonValueObject(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .jsonValueNull:
            try container.encode(Kind.jsonValueNull, forKey: .type)
        case let .jsonValueBoolean(value):
            try container.encode(Kind.jsonValueBoolean, forKey: .type)
            try value.encode(to: encoder)
        case let .jsonValueNumber(value):
            try container.encode(Kind.jsonValueNumber, forKey: .type)
            try value.encode(to: encoder)
        case let .jsonValueString(value):
            try container.encode(Kind.jsonValueString, forKey: .type)
            try value.encode(to: encoder)
        case let .jsonValueArray(value):
            try container.encode(Kind.jsonValueArray, forKey: .type)
            try value.encode(to: encoder)
        case let .jsonValueObject(value):
            try container.encode(Kind.jsonValueObject, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// Represents a boolean JSON value
internal struct JsonValueBoolean: Codable {
    /// The value
    internal let value: Bool

    internal init(value: Bool) {
        self.value = value
    }
}

/// Represents a numeric JSON value
internal struct JsonValueNumber: Codable {
    /// The value
    internal let value: Double

    internal init(value: Double) {
        self.value = value
    }
}

/// Represents a string JSON value
internal struct JsonValueString: Codable {
    /// The value
    internal let value: String

    internal init(value: String) {
        self.value = value
    }
}

/// Represents a JSON array
internal struct JsonValueArray: Codable {
    /// The list of array elements
    internal let values: [JsonValue]

    internal init(values: [JsonValue]) {
        self.values = values
    }
}

/// Represents a JSON object
internal struct JsonValueObject: Codable {
    /// The list of object members
    internal let members: [JsonObjectMember]

    internal init(members: [JsonObjectMember]) {
        self.members = members
    }
}
