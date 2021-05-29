//
//  TestVectorString.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A simple object containing a vector of strings; for testing only
internal struct TestVectorString: Codable {
    /// Vector of strings
    internal let value: [String]

    internal init(value: [String]) {
        self.value = value
    }
}
