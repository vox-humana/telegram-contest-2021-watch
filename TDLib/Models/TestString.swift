//
//  TestString.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A simple object containing a string; for testing only
internal struct TestString: Codable {
    /// String
    internal let value: String

    internal init(value: String) {
        self.value = value
    }
}
