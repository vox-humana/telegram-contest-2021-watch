//
//  LogStream.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Describes a stream to which TDLib internal log is written
internal enum LogStream: Codable {
    /// The log is written to stderr or an OS specific log
    case logStreamDefault

    /// The log is written to a file
    case logStreamFile(LogStreamFile)

    /// The log is written nowhere
    case logStreamEmpty

    private enum Kind: String, Codable {
        case logStreamDefault
        case logStreamFile
        case logStreamEmpty
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .logStreamDefault:
            self = .logStreamDefault
        case .logStreamFile:
            let value = try LogStreamFile(from: decoder)
            self = .logStreamFile(value)
        case .logStreamEmpty:
            self = .logStreamEmpty
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case .logStreamDefault:
            try container.encode(Kind.logStreamDefault, forKey: .type)
        case let .logStreamFile(value):
            try container.encode(Kind.logStreamFile, forKey: .type)
            try value.encode(to: encoder)
        case .logStreamEmpty:
            try container.encode(Kind.logStreamEmpty, forKey: .type)
        }
    }
}

/// The log is written to a file
internal struct LogStreamFile: Codable {
    /// The maximum size of the file to where the internal TDLib log is written before the file will be auto-rotated
    internal let maxFileSize: Int64

    /// Path to the file to where the internal TDLib log will be written
    internal let path: String

    /// Pass true to additionally redirect stderr to the log file. Ignored on Windows
    internal let redirectStderr: Bool

    internal init(
        maxFileSize: Int64,
        path: String,
        redirectStderr: Bool
    ) {
        self.maxFileSize = maxFileSize
        self.path = path
        self.redirectStderr = redirectStderr
    }
}
