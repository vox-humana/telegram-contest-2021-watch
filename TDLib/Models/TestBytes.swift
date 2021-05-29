//
//  TestBytes.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A simple object containing a sequence of bytes; for testing only
internal struct TestBytes: Codable {
    /// Bytes
    internal let value: Data

    internal init(value: Data) {
        self.value = value
    }
}
