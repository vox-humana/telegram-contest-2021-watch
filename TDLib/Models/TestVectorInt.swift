//
//  TestVectorInt.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// A simple object containing a vector of numbers; for testing only
internal struct TestVectorInt: Codable {
    /// Vector of numbers
    internal let value: [Int]

    internal init(value: [Int]) {
        self.value = value
    }
}
