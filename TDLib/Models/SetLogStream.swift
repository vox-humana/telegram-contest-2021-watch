//
//  SetLogStream.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Sets new log stream for internal logging of TDLib. Can be called synchronously
internal struct SetLogStream: Codable {
    /// New log stream
    internal let logStream: LogStream

    internal init(logStream: LogStream) {
        self.logStream = logStream
    }
}
